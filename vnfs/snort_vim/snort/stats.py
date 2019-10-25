#!/usr/bin/python
import yaml
import sys


def parse_line(line):
    k = line.split(":")[0].strip(" :._-")
    k = "snort3_total_%s" % k
    v = line.split(":")[1].strip()
    v = v.split(" ")[0]
    v = float(v)
    return k, v


def filter(line):
    flist = [
        "dropped:",
        "received:",
        "analyzed:",
        "outstanding:",
        "allow:",
        "discards:",
        "sessions:",
        "max bytes:",
        "seconds:",
        "packets:",
        "pkts/sec:"
    ]
    for f in flist:
        if f in line:
            return True
    return False


def main():
    INPUT = "/var/log/snort/snort_output.log"
    OUTPUT = sys.argv[1]
    print "Started result processing ..."
    result = dict()
    # read snort3 log file
    with open(INPUT, "r") as f:
        for line in f.readlines():
            if filter(line):
                k, v = parse_line(line)
                if k in result:
                    print "Skipping: %r" % k
                    continue
                result[k] = v
                print "Added: %s = %f" % (k, v)
            if "Module Statistics" in line:
                break  # stop processing
    # write yml
    print "Writing %r" % OUTPUT
    with open(OUTPUT, "w") as f:
        yaml.dump(result, f, default_flow_style=False)
    print "done."


if __name__ == '__main__':
    main()
