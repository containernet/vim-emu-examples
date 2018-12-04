# vim-emu-examples

A collection of up-to-date examples for [vim-emu](https://osm.etsi.org/wikipub/index.php/VIM_emulator).

## What is vim-emu?

TODO

## Why this repository?

Older examples for vim-emu a spread over many different (and unfortunately outdated) project repositories. This makes it hard to get started with vim-emu. This project tries to change this.

## Examples

All the examples in this repository are placed in different folders to categorize them and keep all the required files to run them, for example the involved VNF descriptors. In addition, there is a [vnfs/](vnfs/) folder that contains Dockerfiles to build all the VNFs used in the various examples. At the end, you only need to clone this repository and [install vim-emu](https://osm.etsi.org/wikipub/index.php/VIM_emulator#Manual_installation_.28vim-emu_only.29) (using *Option 1: Bare-metal installation without OSM*) and you are ready to go. Each example is documented and explained using the README.md file in the root of its folder.

---

### Running examples

#### vim-emu command line examples

These examples use a bare-metal vim-emu installation and its command line client and shows how to manually deploy, configure, and chain VNFs.

* [Example 1.01: Deploy and chain empty VNFs (TODO)](TODO)
* [Example 1.02: Deploy and test a simple IDS (Snort) VNF (TODO)](TODO)

#### 5GTANGO LLCM examples

These examples make use of the 5GTANGO *lightweight lifecycle manager* included in vim-emu to automatically deploy ETSI SOL004-aligned 5GTANGO network services.

* [Example 2.01: Package and deploy a Snort network service package (TODO)](TODO)

##### OSM examples

* TODO

### Planned examples

* [ ] further OSM examles

---

## Call for contributions

External contributions that document and show different use cases of vim-emu are very welcome! Feel free to create a pull request to this repository.

## Contact

Manuel Peuster<br>
Twitter: [@ManuelPeuster](https://twitter.com/ManuelPeuster)<br>
Mail: manuel (at) peuster (dot) de <br>
