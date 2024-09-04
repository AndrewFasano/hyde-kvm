# Hypervisor Dissociative Execution (HyDE) Kernel-based Virtual Machine (KVM)

HyDE (Hypervisor Dissociative Execution) is an innovative, modified virtualization environment that empowers the host system to inject system calls into a guest virtual machine, enabling advanced control and monitoring of guest behavior. This repository contains the customized Linux KVM (Kernel-based Virtual Machine) logic essential for implementing HyDE.

This repository contains the customized Linux KVM logic for HyDE. The `kvm` directory contains a customized version of Linux kernel version 6.2.2's `linux/arch/x86/kvm/` directory. These changes are also shown in the file `hyde_kvm.patch`.

A build helper is provided to build a 6.2.2 kernel with these changes, just run `./build_with_docker.sh` and follow the instructions to install the kernel that is built.

## Repositories
- [HyDE Core](https://github.com/AndrewFasano/hyde-capabilities): HyDE SDK, examples, and documentation.
- [HyDE KVM](https://github.com/AndrewFasano/hyde-kvm): Customized Linux KVM logic for HyDE.
- [HyDE QEMU](https://github.com/AndrewFasano/hyde-qemu) Customized QEMU for HyDE.

## License
As described in the COPYING file, this repository is licensed under the GNU General Public License version 2.

## Citation
To cite our work, please use the following BibTeX entry:

```
@inproceedings{fasano2024hypervisor,
  title={Hypervisor Dissociative Execution: Programming Guests for Monitoring, Management, and Security},
  author={Fasano, Andrew and Estrada, Zak and Leek, Tim and Robertson, William},
  booktitle={Proceedings of the Annual Computer Security Applications Conference},
  series={ACSAC '24},
  year={2024},
  month={Dec},
  address={Waikiki, Hawaii, USA},
  publisher={Association for Computing Machinery},
  location={Waikiki, Hawaii, USA},
  dates={9-13}
}
```