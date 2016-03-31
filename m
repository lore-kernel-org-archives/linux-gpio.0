From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Thu, 31 Mar 2016 12:24:53 +0300
Message-ID: <20160331092453.GG2099@lahna.fi.intel.com>
References: <20160322154950.GB2099@lahna.fi.intel.com>
 <CACPiFCKS-8re6g1Zbhs8N9D_tDMENqXPeNGRS_0dU6tzz50T8A@mail.gmail.com>
 <20160322162222.GF2099@lahna.fi.intel.com>
 <CACPiFCKD_Nwut=GL-xOU5gN2k8Na7pFWdhsms85QsDTvvREJLw@mail.gmail.com>
 <1458668165.5907.28.camel@linux.intel.com>
 <CACPiFC+_TpiFFm+hYJd1tX4AnadxSj_KKOtDALjSj0_c8Qa2pA@mail.gmail.com>
 <20160323112532.GK2099@lahna.fi.intel.com>
 <CACPiFCJg0dx+zFnybtMBKH3jKrMQgwpfiD9Q8YhvpvC6YW68Yg@mail.gmail.com>
 <CACPiFC+7m_ePr59M=upxsjXF1f0Z8uLcOiy58DDCcOpOA-rhyA@mail.gmail.com>
 <20160329091514.GA2099@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:44154 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756519AbcCaJY6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 31 Mar 2016 05:24:58 -0400
Content-Disposition: inline
In-Reply-To: <20160329091514.GA2099@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Langhoff <martin.langhoff@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 29, 2016 at 12:15:14PM +0300, Mika Westerberg wrote:
> > I'm about to lose access to this laptop as I am traveling back home,
> > leaving it with its new owner...
> 
> We will try to get one such machine here to debug the issue further.
> Thanks.

To follow up on this now. I finally got almost similar laptop. This is
Acer Aspire One Cloudbook 11 A01-131-C39W.

I've tried v4.6-rc1 on that and it works just fine (dmesg is attached).
I have pinctrl and IO-APIC enabled among other things.

I checked from Windows side that it uses ACPI to enumerate most devices
and that is what Linux is also doing. In your case lspci output showed
LPSS I2C and DMA controllers that are not supposed to be there if ACPI
is used to enumerate them. I've seen once that the BIOS had bug where it
exposed same devices in both modes at the same time. This obviosly
causes problems.

There might be a BIOS upgrade for that particular laptop that fixes the
issue.

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg.aspire-one"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 4.6.0-rc1 (westeri@lahna) (gcc version 5.3.1 2=
0151207 (Red Hat 5.3.1-2) (GCC) ) #61 SMP Thu Mar 31 12:06:38 EEST 2016
[    0.000000] Command line: vmlinuz.efi initrd=3Dinitrd console=3DttyS0,11=
5200n8 console=3Dtty1
[    0.000000] x86/fpu: Legacy x87 FPU detected.
[    0.000000] x86/fpu: Using 'eager' FPU context switches.
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000006efff] usable
[    0.000000] BIOS-e820: [mem 0x000000000006f000-0x000000000006ffff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x0000000000070000-0x0000000000085fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000086000-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001fffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000020000000-0x00000000201fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000020200000-0x0000000079b78fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000079b79000-0x000000007a578fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000007a579000-0x000000007a778fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x000000007a779000-0x000000007a7b8fff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x000000007a7b9000-0x000000007b441fff] usable
[    0.000000] BIOS-e820: [mem 0x000000007b442000-0x000000007bd41fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000007bd42000-0x000000007bffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000e00f8000-0x00000000e00f8fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed01000-0x00000000fed01fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ffa00000-0x00000000ffffffff] reser=
ved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0x73671018-0x73681057] usable =3D=3D> usab=
le
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000006ef=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000006f000-0x000000000006ff=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000000070000-0x0000000000085f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000000086000-0x000000000009ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x000000001fffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000020000000-0x00000000201fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000020200000-0x00000000736710=
17] usable
[    0.000000] reserve setup_data: [mem 0x0000000073671018-0x00000000736810=
57] usable
[    0.000000] reserve setup_data: [mem 0x0000000073681058-0x0000000079b78f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000079b79000-0x000000007a578f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000007a579000-0x000000007a778f=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000007a779000-0x000000007a7b8f=
ff] ACPI data
[    0.000000] reserve setup_data: [mem 0x000000007a7b9000-0x000000007b441f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000007b442000-0x000000007bd41f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000007bd42000-0x000000007bffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000e00f8000-0x00000000e00f8f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed01000-0x00000000fed01f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ffa00000-0x00000000ffffff=
ff] reserved
[    0.000000] efi: EFI v2.40 by INSYDE Corp.
[    0.000000] efi:  ACPI 2.0=3D0x7a7b8014  ESRT=3D0x79f0c718  SMBIOS=3D0x7=
9f08000=20
[    0.000000] esrt: Reserving ESRT space from 0x0000000079f0c718 to 0x0000=
000079f0c750.
[    0.000000] SMBIOS 2.8 present.
[    0.000000] DMI: Acer Aspire one 1-131/Caltech, BIOS V1.06 07/30/2015
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] e820: last_pfn =3D 0x7c000 max_arch_pfn =3D 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 0FFC00000 mask FFFC00000 write-protect
[    0.000000]   1 base 0FFA00000 mask FFFE00000 write-protect
[    0.000000]   2 base 000000000 mask F80000000 write-back
[    0.000000]   3 base 07C000000 mask FFC000000 uncachable
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- WT=
 =20
[    0.000000] Base memory trampoline at [ffff880000080000] 80000 size 24576
[    0.000000] BRK [0x0202b000, 0x0202bfff] PGTABLE
[    0.000000] BRK [0x0202c000, 0x0202cfff] PGTABLE
[    0.000000] BRK [0x0202d000, 0x0202dfff] PGTABLE
[    0.000000] BRK [0x0202e000, 0x0202efff] PGTABLE
[    0.000000] BRK [0x0202f000, 0x0202ffff] PGTABLE
[    0.000000] BRK [0x02030000, 0x02030fff] PGTABLE
[    0.000000] RAMDISK: [mem 0x6e894000-0x7217dfff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x000000007A7B8014 000024 (v02 ACRSYS)
[    0.000000] ACPI: XSDT 0x000000007A7B8120 0000BC (v01 ACRSYS ACRPRDCT 00=
000003      01000013)
[    0.000000] ACPI: FACP 0x000000007A7AF000 00010C (v05 ACRSYS ACRPRDCT 00=
000003 1025 00040000)
[    0.000000] ACPI: DSDT 0x000000007A79E000 00B7A7 (v02 ACRSYS ACRPRDCT 00=
000003 1025 00040000)
[    0.000000] ACPI: FACS 0x000000007A774000 000040
[    0.000000] ACPI: UEFI 0x000000007A7B7000 000236 (v01 ACRSYS ACRPRDCT 00=
000001 1025 00040000)
[    0.000000] ACPI: TCPA 0x000000007A7B6000 000032 (v02 ACRSYS ACRPRDCT 00=
000000 1025 00040000)
[    0.000000] ACPI: MSDM 0x000000007A7B5000 000055 (v03 ACRSYS ACRPRDCT 00=
000001 1025 00040000)
[    0.000000] ACPI: UEFI 0x000000007A7B4000 000042 (v01 ACRSYS ACRPRDCT 00=
000000 1025 00040000)
[    0.000000] ACPI: SSDT 0x000000007A7B0000 003A2A (v01 ACRSYS ACRPRDCT 00=
001000 1025 00040000)
[    0.000000] ACPI: HPET 0x000000007A7AE000 000038 (v01 ACRSYS ACRPRDCT 00=
000003 1025 00040000)
[    0.000000] ACPI: MCFG 0x000000007A7AC000 00003C (v01 ACRSYS ACRPRDCT 00=
000003 1025 00040000)
[    0.000000] ACPI: SSDT 0x000000007A7AB000 00052C (v01 ACRSYS ACRPRDCT 00=
000003 1025 00040000)
[    0.000000] ACPI: SSDT 0x000000007A7AA000 000898 (v01 ACRSYS ACRPRDCT 00=
000003 1025 00040000)
[    0.000000] ACPI: SSDT 0x000000007A79D000 000763 (v01 ACRSYS ACRPRDCT 00=
003000 1025 00040000)
[    0.000000] ACPI: SSDT 0x000000007A79C000 000290 (v01 ACRSYS ACRPRDCT 00=
003000 1025 00040000)
[    0.000000] ACPI: SSDT 0x000000007A79B000 00017A (v01 ACRSYS ACRPRDCT 00=
003000 1025 00040000)
[    0.000000] ACPI: APIC 0x000000007A7AD000 000084 (v03 ACRSYS ACRPRDCT 00=
000003 1025 00040000)
[    0.000000] ACPI: SSDT 0x000000007A79A000 000432 (v01 ACRSYS ACRPRDCT 00=
001000 1025 00040000)
[    0.000000] ACPI: TPM2 0x000000007A799000 000034 (v03 ACRSYS ACRPRDCT 00=
000000 1025 00040000)
[    0.000000] ACPI: CSRT 0x000000007A798000 00014C (v00 ACRSYS ACRPRDCT 00=
000005 1025 00040000)
[    0.000000] ACPI: FPDT 0x000000007A797000 000044 (v01 ACRSYS ACRPRDCT 00=
000002 1025 00040000)
[    0.000000] ACPI: BGRT 0x000000007A796000 000038 (v01 ACRSYS ACRPRDCT 00=
000001 1025 00040000)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000007bffffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x797bd000-0x797cefff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x000000007bffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x000000000006efff]
[    0.000000]   node   0: [mem 0x0000000000070000-0x0000000000085fff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x000000001fffffff]
[    0.000000]   node   0: [mem 0x0000000020200000-0x0000000079b78fff]
[    0.000000]   node   0: [mem 0x000000007a7b9000-0x000000007b441fff]
[    0.000000]   node   0: [mem 0x000000007bd42000-0x000000007bffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000007bfff=
fff]
[    0.000000] On node 0 totalpages: 501828
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3972 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 7872 pages used for memmap
[    0.000000]   DMA32 zone: 497856 pages, LIFO batch:31
[    0.000000] Reserving Intel graphics stolen memory at 0x7ce00000-0x7edff=
fff
[    0.000000] ACPI: PM-Timer IO Port: 0x408
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high level lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x02] high level lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x03] high level lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x04] high level lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, GSI 0-=
114
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.000000] smpboot: Allowing 4 CPUs, 2 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x0006f000-0x0006ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x00086000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x20000000-0x201fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x73671000-0x73671fff]
[    0.000000] PM: Registered nosave memory: [mem 0x73681000-0x73681fff]
[    0.000000] PM: Registered nosave memory: [mem 0x79b79000-0x7a578fff]
[    0.000000] PM: Registered nosave memory: [mem 0x7a579000-0x7a778fff]
[    0.000000] PM: Registered nosave memory: [mem 0x7a779000-0x7a7b8fff]
[    0.000000] PM: Registered nosave memory: [mem 0x7b442000-0x7bd41fff]
[    0.000000] e820: [mem 0x7ee00000-0xe00f7fff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    0.000000] setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:4 nr_=
node_ids:1
[    0.000000] percpu: Embedded 33 pages/cpu @ffff880079400000 s98136 r8192=
 d28840 u524288
[    0.000000] pcpu-alloc: s98136 r8192 d28840 u524288 alloc=3D1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3=20
[    0.000000] Built 1 zonelists in Node order, mobility grouping on.  Tota=
l pages: 493871
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: vmlinuz.efi initrd=3Dinitrd console=3Dt=
tyS0,115200n8 console=3Dtty1
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Memory: 1858560K/2007312K available (7471K kernel code, 1263=
K rwdata, 3096K rodata, 1512K init, 1448K bss, 148752K reserved, 0K cma-res=
erved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	Build-time adjustment of leaf fanout to 64.
[    0.000000] 	RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=3D4.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D64, nr_cpu_ids=
=3D4
[    0.000000] NR_IRQS:4352 nr_irqs:1024 16
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty1] enabled
[    0.000000] console [ttyS0] enabled
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484882848 ns
[    0.000000] hpet clockevent registered
[    0.000000] tsc: PIT calibration matches HPET. 1 loops
[    0.000000] tsc: Detected 1599.994 MHz processor
[    0.000048] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 3199.98 BogoMIPS (lpj=3D1599994)
[    0.011963] pid_max: default: 32768 minimum: 301
[    0.017160] ACPI: Core revision 20160108
[    0.049042] ACPI: 8 ACPI AML tables successfully acquired and loaded
[    0.056191]=20
[    0.058901] Security Framework initialized
[    0.063509] SELinux:  Initializing.
[    0.067448] SELinux:  Starting in permissive mode
[    0.067889] Dentry cache hash table entries: 262144 (order: 9, 2097152 b=
ytes)
[    0.077112] Inode-cache hash table entries: 131072 (order: 8, 1048576 by=
tes)
[    0.085616] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.093157] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 b=
ytes)
[    0.101725] CPU: Physical Processor ID: 0
[    0.106231] CPU: Processor Core ID: 0
[    0.110346] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.117080] ENERGY_PERF_BIAS: View and update with x86_energy_perf_polic=
y(8)
[    0.124989] mce: CPU supports 6 MCE banks
[    0.129503] CPU0: Thermal monitoring enabled (TM1)
[    0.134879] process: using mwait in idle threads
[    0.140061] Last level iTLB entries: 4KB 48, 2MB 0, 4MB 0
[    0.146113] Last level dTLB entries: 4KB 256, 2MB 16, 4MB 16, 1GB 0
[    0.153651] Freeing SMP alternatives memory: 32K (ffffffff81eb7000 - fff=
fffff81ebf000)
[    0.170089] ftrace: allocating 28904 entries in 113 pages
[    0.197047] smpboot: Max logical packages: 2
[    0.201857] smpboot: APIC(0) Converting physical 0 to logical package 0
[    0.211254] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.227984] TSC deadline timer enabled
[    0.227995] smpboot: CPU0: Intel(R) Celeron(R) CPU  N3050  @ 1.60GHz (fa=
mily: 0x6, model: 0x4c, stepping: 0x3)
[    0.239252] Performance Events: PEBS fmt2+, 8-deep LBR, Silvermont event=
s, full-width counters, Intel PMU driver.
[    0.250819] ... version:                3
[    0.255306] ... bit width:              40
[    0.259889] ... generic registers:      2
[    0.264377] ... value mask:             000000ffffffffff
[    0.270320] ... max period:             000000ffffffffff
[    0.276264] ... fixed-purpose events:   3
[    0.280750] ... event mask:             0000000700000003
[    0.288456] x86: Booting SMP configuration:
[    0.293151] .... node  #0, CPUs:      #1
[    0.359137] x86: Booted up 1 node, 2 CPUs
[    0.363835] smpboot: Total of 2 processors activated (6410.61 BogoMIPS)
[    0.371429] NMI watchdog: enabled on all CPUs, permanently consumes one =
hw-PMU counter.
[    0.381529] devtmpfs: initialized
[    0.385413] x86/mm: Memory block size: 128MB
[    0.398172] PM: Registering ACPI NVS region [mem 0x0006f000-0x0006ffff] =
(4096 bytes)
[    0.406851] PM: Registering ACPI NVS region [mem 0x7a579000-0x7a778fff] =
(2097152 bytes)
[    0.416067] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    0.427133] atomic64_test: passed for x86-64 platform with CX8 and with =
SSE
[    0.434932] pinctrl core: initialized pinctrl subsystem
[    0.440903] RTC time: 20:15:01, date: 03/31/16
[    0.446241] NET: Registered protocol family 16
[    0.455254] cpuidle: using governor menu
[    0.459831] ACPI: bus type PCI registered
[    0.464329] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.471725] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xe0000000=
-0xe3ffffff] (base 0xe0000000)
[    0.482153] PCI: not using MMCONFIG
[    0.486062] PCI: Using configuration type 1 for base access
[    0.499679] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.507485] ACPI: Added _OSI(Module Device)
[    0.512179] ACPI: Added _OSI(Processor Device)
[    0.517157] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.522425] ACPI: Added _OSI(Processor Aggregator Device)
[    0.542635] ACPI: Dynamic OEM Table Load:
[    0.547169] ACPI: SSDT 0xFFFF880074B03000 000634 (v01 PmRef  Cpu0Ist  00=
003000 INTL 20120913)
[    0.558190] ACPI: Dynamic OEM Table Load:
[    0.562716] ACPI: SSDT 0xFFFF880074B7C800 0003A5 (v01 PmRef  Cpu0Cst  00=
003001 INTL 20120913)
[    0.574176] ACPI: Dynamic OEM Table Load:
[    0.578701] ACPI: SSDT 0xFFFF880074B60E00 00015F (v01 PmRef  ApIst    00=
003000 INTL 20120913)
[    0.589641] ACPI: Dynamic OEM Table Load:
[    0.594164] ACPI: SSDT 0xFFFF880074B3D180 00008D (v01 PmRef  ApCst    00=
003000 INTL 20120913)
[    0.605824] ACPI: Interpreter enabled
[    0.609982] ACPI: (supports S0 S3 S4 S5)
[    0.614377] ACPI: Using IOAPIC for interrupt routing
[    0.620016] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xe0000000=
-0xe3ffffff] (base 0xe0000000)
[    0.632994] PCI: MMCONFIG at [mem 0xe0000000-0xe3ffffff] reserved in ACP=
I motherboard resources
[    0.642755] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.655879] ACPI: Power Resource [USBC] (on)
[    0.669073] ACPI: Power Resource [CLK0] (on)
[    0.680300] ACPI: Power Resource [CLK0] (on)
[    0.685178] ACPI: Power Resource [CLK1] (on)
[    0.701175] ACPI: Power Resource [ID3C] (off)
[    0.712730] ACPI: Power Resource [FN00] (on)
[    0.718542] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.725476] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[    0.734736] \_SB_.PCI0 (33DB4D5B-1FF7-401C-9657-7441C03DD766): _OSC inva=
lid UUID
[    0.734740] _OSC request data: 1 1f 0
[    0.734752] acpi PNP0A08:00: _OSC failed (AE_ERROR); disabling ASPM
[    0.741799] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [=
bus 00-3f] only partially covers this bridge
[    0.754395] PCI host bridge to bus 0000:00
[    0.758990] pci_bus 0000:00: root bus resource [io  0x0070-0x0077]
[    0.765915] pci_bus 0000:00: root bus resource [io  0x0000-0x006f window]
[    0.773517] pci_bus 0000:00: root bus resource [io  0x0078-0x0cf7 window]
[    0.781117] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.788717] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.797098] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dfff=
f window]
[    0.805479] pci_bus 0000:00: root bus resource [mem 0x000e0000-0x000ffff=
f window]
[    0.813859] pci_bus 0000:00: root bus resource [mem 0x80000000-0xdffffff=
f window]
[    0.822242] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.828399] pci 0000:00:00.0: [8086:2280] type 00 class 0x060000
[    0.828753] pci 0000:00:02.0: [8086:22b1] type 00 class 0x030000
[    0.828785] pci 0000:00:02.0: reg 0x10: [mem 0x90000000-0x90ffffff 64bit]
[    0.828801] pci 0000:00:02.0: reg 0x18: [mem 0x80000000-0x8fffffff 64bit=
 pref]
[    0.828814] pci 0000:00:02.0: reg 0x20: [io  0x1000-0x103f]
[    0.829089] pci 0000:00:0b.0: [8086:22dc] type 00 class 0x118000
[    0.829117] pci 0000:00:0b.0: reg 0x10: [mem 0x9131c000-0x9131cfff 64bit]
[    0.829415] pci 0000:00:14.0: [8086:22b5] type 00 class 0x0c0330
[    0.829450] pci 0000:00:14.0: reg 0x10: [mem 0x91300000-0x9130ffff 64bit]
[    0.829563] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.829775] pci 0000:00:14.0: System wakeup disabled by ACPI
[    0.836221] pci 0000:00:1a.0: [8086:2298] type 00 class 0x108000
[    0.836250] pci 0000:00:1a.0: reg 0x10: [mem 0x91200000-0x912fffff]
[    0.836264] pci 0000:00:1a.0: reg 0x14: [mem 0x91100000-0x911fffff]
[    0.836366] pci 0000:00:1a.0: PME# supported from D0 D3hot
[    0.836628] pci 0000:00:1b.0: [8086:2284] type 00 class 0x040300
[    0.836664] pci 0000:00:1b.0: reg 0x10: [mem 0x91310000-0x91313fff 64bit]
[    0.836782] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.836926] pci 0000:00:1b.0: System wakeup disabled by ACPI
[    0.843524] pci 0000:00:1c.0: [8086:22c8] type 01 class 0x060400
[    0.845024] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.845392] pci 0000:00:1c.0: System wakeup disabled by ACPI
[    0.851984] pci 0000:00:1c.2: [8086:22cc] type 01 class 0x060400
[    0.853500] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.853868] pci 0000:00:1c.2: System wakeup disabled by ACPI
[    0.860314] pci 0000:00:1f.0: [8086:229c] type 00 class 0x060100
[    0.860669] pci 0000:00:1f.3: [8086:2292] type 00 class 0x0c0500
[    0.860726] pci 0000:00:1f.3: reg 0x10: [mem 0x9131d000-0x9131d01f]
[    0.860847] pci 0000:00:1f.3: reg 0x20: [io  0x1040-0x105f]
[    0.861841] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.868339] pci 0000:02:00.0: [8086:08b3] type 00 class 0x028000
[    0.868480] pci 0000:02:00.0: reg 0x10: [mem 0x91000000-0x91001fff 64bit]
[    0.868853] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.869049] pci 0000:02:00.0: System wakeup disabled by ACPI
[    0.877552] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.883200] pci 0000:00:1c.2:   bridge window [mem 0x91000000-0x910fffff]
[    0.887589] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 11 12 14 15=
) *0, disabled.
[    0.896802] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 10 11 12 14 15=
) *0, disabled.
[    0.905994] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 11 12 14 15=
) *0, disabled.
[    0.915205] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 11 12 14 15=
) *0, disabled.
[    0.924412] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 11 12 14 15=
) *0, disabled.
[    0.933612] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 11 12 14 15=
) *0, disabled.
[    0.942814] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 11 12 14 15=
) *0, disabled.
[    0.952022] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 11 12 14 15=
) *0, disabled.
[    0.961744] cherryview-pinctrl INT33FF:00: try to register 56 pins ...
[    0.961751] pinctrl core: registered pin 0 (FST_SPI_D2) on INT33FF:00
[    0.961757] pinctrl core: registered pin 1 (FST_SPI_D0) on INT33FF:00
[    0.961760] pinctrl core: registered pin 2 (FST_SPI_CLK) on INT33FF:00
[    0.961768] pinctrl core: registered pin 3 (FST_SPI_D3) on INT33FF:00
[    0.961772] pinctrl core: registered pin 4 (FST_SPI_CS1_B) on INT33FF:00
[    0.961775] pinctrl core: registered pin 5 (FST_SPI_D1) on INT33FF:00
[    0.961778] pinctrl core: registered pin 6 (FST_SPI_CS0_B) on INT33FF:00
[    0.961781] pinctrl core: registered pin 7 (FST_SPI_CS2_B) on INT33FF:00
[    0.961784] pinctrl core: registered pin 15 (UART1_RTS_B) on INT33FF:00
[    0.961788] pinctrl core: registered pin 16 (UART1_RXD) on INT33FF:00
[    0.961791] pinctrl core: registered pin 17 (UART2_RXD) on INT33FF:00
[    0.961794] pinctrl core: registered pin 18 (UART1_CTS_B) on INT33FF:00
[    0.961797] pinctrl core: registered pin 19 (UART2_RTS_B) on INT33FF:00
[    0.961800] pinctrl core: registered pin 20 (UART1_TXD) on INT33FF:00
[    0.961803] pinctrl core: registered pin 21 (UART2_TXD) on INT33FF:00
[    0.961807] pinctrl core: registered pin 22 (UART2_CTS_B) on INT33FF:00
[    0.961810] pinctrl core: registered pin 30 (MF_HDA_CLK) on INT33FF:00
[    0.961813] pinctrl core: registered pin 31 (MF_HDA_RSTB) on INT33FF:00
[    0.961816] pinctrl core: registered pin 32 (MF_HDA_SDIO) on INT33FF:00
[    0.961819] pinctrl core: registered pin 33 (MF_HDA_SDO) on INT33FF:00
[    0.961822] pinctrl core: registered pin 34 (MF_HDA_DOCKRSTB) on INT33FF=
:00
[    0.961825] pinctrl core: registered pin 35 (MF_HDA_SYNC) on INT33FF:00
[    0.961829] pinctrl core: registered pin 36 (MF_HDA_SDI1) on INT33FF:00
[    0.961832] pinctrl core: registered pin 37 (MF_HDA_DOCKENB) on INT33FF:=
00
[    0.961836] pinctrl core: registered pin 45 (I2C5_SDA) on INT33FF:00
[    0.961839] pinctrl core: registered pin 46 (I2C4_SDA) on INT33FF:00
[    0.961842] pinctrl core: registered pin 47 (I2C6_SDA) on INT33FF:00
[    0.961845] pinctrl core: registered pin 48 (I2C5_SCL) on INT33FF:00
[    0.961848] pinctrl core: registered pin 49 (I2C_NFC_SDA) on INT33FF:00
[    0.961851] pinctrl core: registered pin 50 (I2C4_SCL) on INT33FF:00
[    0.961854] pinctrl core: registered pin 51 (I2C6_SCL) on INT33FF:00
[    0.961857] pinctrl core: registered pin 52 (I2C_NFC_SCL) on INT33FF:00
[    0.961861] pinctrl core: registered pin 60 (I2C1_SDA) on INT33FF:00
[    0.961864] pinctrl core: registered pin 61 (I2C0_SDA) on INT33FF:00
[    0.961867] pinctrl core: registered pin 62 (I2C2_SDA) on INT33FF:00
[    0.961870] pinctrl core: registered pin 63 (I2C1_SCL) on INT33FF:00
[    0.961875] pinctrl core: registered pin 64 (I2C3_SDA) on INT33FF:00
[    0.961879] pinctrl core: registered pin 65 (I2C0_SCL) on INT33FF:00
[    0.961882] pinctrl core: registered pin 66 (I2C2_SCL) on INT33FF:00
[    0.961885] pinctrl core: registered pin 67 (I2C3_SCL) on INT33FF:00
[    0.961888] pinctrl core: registered pin 75 (SATA_GP0) on INT33FF:00
[    0.961891] pinctrl core: registered pin 76 (SATA_GP1) on INT33FF:00
[    0.961895] pinctrl core: registered pin 77 (SATA_LEDN) on INT33FF:00
[    0.961910] pinctrl core: registered pin 78 (SATA_GP2) on INT33FF:00
[    0.961914] pinctrl core: registered pin 79 (MF_SMB_ALERTB) on INT33FF:00
[    0.961917] pinctrl core: registered pin 80 (SATA_GP3) on INT33FF:00
[    0.961920] pinctrl core: registered pin 81 (MF_SMB_CLK) on INT33FF:00
[    0.961923] pinctrl core: registered pin 82 (MF_SMB_DATA) on INT33FF:00
[    0.961927] pinctrl core: registered pin 90 (PCIE_CLKREQ0B) on INT33FF:00
[    0.961930] pinctrl core: registered pin 91 (PCIE_CLKREQ1B) on INT33FF:00
[    0.961933] pinctrl core: registered pin 92 (GP_SSP_2_CLK) on INT33FF:00
[    0.961936] pinctrl core: registered pin 93 (PCIE_CLKREQ2B) on INT33FF:00
[    0.961939] pinctrl core: registered pin 94 (GP_SSP_2_RXD) on INT33FF:00
[    0.961942] pinctrl core: registered pin 95 (PCIE_CLKREQ3B) on INT33FF:00
[    0.961946] pinctrl core: registered pin 96 (GP_SSP_2_FS) on INT33FF:00
[    0.961949] pinctrl core: registered pin 97 (GP_SSP_2_TXD) on INT33FF:00
[    0.961954] cherryview-pinctrl INT33FF:00: failed to lookup the default =
state
[    0.961958] cherryview-pinctrl INT33FF:00: failed to lookup the sleep st=
ate
[    0.962514] cherryview-pinctrl INT33FF:01: try to register 59 pins ...
[    0.962519] pinctrl core: registered pin 0 (GPIO_DFX_0) on INT33FF:01
[    0.962530] pinctrl core: registered pin 1 (GPIO_DFX_3) on INT33FF:01
[    0.962533] pinctrl core: registered pin 2 (GPIO_DFX_7) on INT33FF:01
[    0.962536] pinctrl core: registered pin 3 (GPIO_DFX_1) on INT33FF:01
[    0.962541] pinctrl core: registered pin 4 (GPIO_DFX_5) on INT33FF:01
[    0.962544] pinctrl core: registered pin 5 (GPIO_DFX_4) on INT33FF:01
[    0.962547] pinctrl core: registered pin 6 (GPIO_DFX_8) on INT33FF:01
[    0.962550] pinctrl core: registered pin 7 (GPIO_DFX_2) on INT33FF:01
[    0.962554] pinctrl core: registered pin 8 (GPIO_DFX_6) on INT33FF:01
[    0.962557] pinctrl core: registered pin 15 (GPIO_SUS0) on INT33FF:01
[    0.962560] pinctrl core: registered pin 16 (SEC_GPIO_SUS10) on INT33FF:=
01
[    0.962563] pinctrl core: registered pin 17 (GPIO_SUS3) on INT33FF:01
[    0.962566] pinctrl core: registered pin 18 (GPIO_SUS7) on INT33FF:01
[    0.962569] pinctrl core: registered pin 19 (GPIO_SUS1) on INT33FF:01
[    0.962572] pinctrl core: registered pin 20 (GPIO_SUS5) on INT33FF:01
[    0.962576] pinctrl core: registered pin 21 (SEC_GPIO_SUS11) on INT33FF:=
01
[    0.962579] pinctrl core: registered pin 22 (GPIO_SUS4) on INT33FF:01
[    0.962582] pinctrl core: registered pin 23 (SEC_GPIO_SUS8) on INT33FF:01
[    0.962586] pinctrl core: registered pin 24 (GPIO_SUS2) on INT33FF:01
[    0.962589] pinctrl core: registered pin 25 (GPIO_SUS6) on INT33FF:01
[    0.962592] pinctrl core: registered pin 26 (CX_PREQ_B) on INT33FF:01
[    0.962595] pinctrl core: registered pin 27 (SEC_GPIO_SUS9) on INT33FF:01
[    0.962599] pinctrl core: registered pin 30 (TRST_B) on INT33FF:01
[    0.962602] pinctrl core: registered pin 31 (TCK) on INT33FF:01
[    0.962605] pinctrl core: registered pin 32 (PROCHOT_B) on INT33FF:01
[    0.962609] pinctrl core: registered pin 33 (SVIDO_DATA) on INT33FF:01
[    0.962612] pinctrl core: registered pin 34 (TMS) on INT33FF:01
[    0.962615] pinctrl core: registered pin 35 (CX_PRDY_B_2) on INT33FF:01
[    0.962618] pinctrl core: registered pin 36 (TDO_2) on INT33FF:01
[    0.962621] pinctrl core: registered pin 37 (CX_PRDY_B) on INT33FF:01
[    0.962624] pinctrl core: registered pin 38 (SVIDO_ALERT_B) on INT33FF:01
[    0.962627] pinctrl core: registered pin 39 (TDO) on INT33FF:01
[    0.962631] pinctrl core: registered pin 40 (SVIDO_CLK) on INT33FF:01
[    0.962634] pinctrl core: registered pin 41 (TDI) on INT33FF:01
[    0.962637] pinctrl core: registered pin 45 (GP_CAMERASB_05) on INT33FF:=
01
[    0.962640] pinctrl core: registered pin 46 (GP_CAMERASB_02) on INT33FF:=
01
[    0.962643] pinctrl core: registered pin 47 (GP_CAMERASB_08) on INT33FF:=
01
[    0.962646] pinctrl core: registered pin 48 (GP_CAMERASB_00) on INT33FF:=
01
[    0.962650] pinctrl core: registered pin 49 (GP_CAMERASB_06) on INT33FF:=
01
[    0.962653] pinctrl core: registered pin 50 (GP_CAMERASB_10) on INT33FF:=
01
[    0.962656] pinctrl core: registered pin 51 (GP_CAMERASB_03) on INT33FF:=
01
[    0.962659] pinctrl core: registered pin 52 (GP_CAMERASB_09) on INT33FF:=
01
[    0.962662] pinctrl core: registered pin 53 (GP_CAMERASB_01) on INT33FF:=
01
[    0.962665] pinctrl core: registered pin 54 (GP_CAMERASB_07) on INT33FF:=
01
[    0.962669] pinctrl core: registered pin 55 (GP_CAMERASB_11) on INT33FF:=
01
[    0.962672] pinctrl core: registered pin 56 (GP_CAMERASB_04) on INT33FF:=
01
[    0.962675] pinctrl core: registered pin 60 (PANEL0_BKLTEN) on INT33FF:01
[    0.962678] pinctrl core: registered pin 61 (HV_DDI0_HPD) on INT33FF:01
[    0.962681] pinctrl core: registered pin 62 (HV_DDI2_DDC_SDA) on INT33FF=
:01
[    0.962684] pinctrl core: registered pin 63 (PANEL1_BKLTCTL) on INT33FF:=
01
[    0.962689] pinctrl core: registered pin 64 (HV_DDI1_HPD) on INT33FF:01
[    0.962692] pinctrl core: registered pin 65 (PANEL0_BKLTCTL) on INT33FF:=
01
[    0.962695] pinctrl core: registered pin 66 (HV_DDI0_DDC_SDA) on INT33FF=
:01
[    0.962698] pinctrl core: registered pin 67 (HV_DDI2_DDC_SCL) on INT33FF=
:01
[    0.962702] pinctrl core: registered pin 68 (HV_DDI2_HPD) on INT33FF:01
[    0.962705] pinctrl core: registered pin 69 (PANEL1_VDDEN) on INT33FF:01
[    0.962708] pinctrl core: registered pin 70 (PANEL1_BKLTEN) on INT33FF:01
[    0.962711] pinctrl core: registered pin 71 (HV_DDI0_DDC_SCL) on INT33FF=
:01
[    0.962714] pinctrl core: registered pin 72 (PANEL0_VDDEN) on INT33FF:01
[    0.962719] cherryview-pinctrl INT33FF:01: failed to lookup the default =
state
[    0.962723] cherryview-pinctrl INT33FF:01: failed to lookup the sleep st=
ate
[    0.963267] cherryview-pinctrl INT33FF:02: try to register 24 pins ...
[    0.963274] pinctrl core: registered pin 0 (PMU_SLP_S3_B) on INT33FF:02
[    0.963277] pinctrl core: registered pin 1 (PMU_BATLOW_B) on INT33FF:02
[    0.963281] pinctrl core: registered pin 2 (SUS_STAT_B) on INT33FF:02
[    0.963284] pinctrl core: registered pin 3 (PMU_SLP_S0IX_B) on INT33FF:02
[    0.963287] pinctrl core: registered pin 4 (PMU_AC_PRESENT) on INT33FF:02
[    0.963290] pinctrl core: registered pin 5 (PMU_PLTRST_B) on INT33FF:02
[    0.963294] pinctrl core: registered pin 6 (PMU_SUSCLK) on INT33FF:02
[    0.963297] pinctrl core: registered pin 7 (PMU_SLP_LAN_B) on INT33FF:02
[    0.963300] pinctrl core: registered pin 8 (PMU_PWRBTN_B) on INT33FF:02
[    0.963303] pinctrl core: registered pin 9 (PMU_SLP_S4_B) on INT33FF:02
[    0.963306] pinctrl core: registered pin 10 (PMU_WAKE_B) on INT33FF:02
[    0.963309] pinctrl core: registered pin 11 (PMU_WAKE_LAN_B) on INT33FF:=
02
[    0.963313] pinctrl core: registered pin 15 (MF_ISH_GPIO_3) on INT33FF:02
[    0.963316] pinctrl core: registered pin 16 (MF_ISH_GPIO_7) on INT33FF:02
[    0.963319] pinctrl core: registered pin 17 (MF_ISH_I2C1_SCL) on INT33FF=
:02
[    0.963322] pinctrl core: registered pin 18 (MF_ISH_GPIO_1) on INT33FF:02
[    0.963325] pinctrl core: registered pin 19 (MF_ISH_GPIO_5) on INT33FF:02
[    0.963328] pinctrl core: registered pin 20 (MF_ISH_GPIO_9) on INT33FF:02
[    0.963332] pinctrl core: registered pin 21 (MF_ISH_GPIO_0) on INT33FF:02
[    0.963335] pinctrl core: registered pin 22 (MF_ISH_GPIO_4) on INT33FF:02
[    0.963338] pinctrl core: registered pin 23 (MF_ISH_GPIO_8) on INT33FF:02
[    0.963341] pinctrl core: registered pin 24 (MF_ISH_GPIO_2) on INT33FF:02
[    0.963344] pinctrl core: registered pin 25 (MF_ISH_GPIO_6) on INT33FF:02
[    0.963347] pinctrl core: registered pin 26 (MF_ISH_I2C1_SDA) on INT33FF=
:02
[    0.963352] cherryview-pinctrl INT33FF:02: failed to lookup the default =
state
[    0.963355] cherryview-pinctrl INT33FF:02: failed to lookup the sleep st=
ate
[    0.963771] cherryview-pinctrl INT33FF:03: try to register 55 pins ...
[    0.963777] pinctrl core: registered pin 0 (MF_PLT_CLK0) on INT33FF:03
[    0.963782] pinctrl core: registered pin 1 (PWM1) on INT33FF:03
[    0.963785] pinctrl core: registered pin 2 (MF_PLT_CLK1) on INT33FF:03
[    0.963788] pinctrl core: registered pin 3 (MF_PLT_CLK4) on INT33FF:03
[    0.963791] pinctrl core: registered pin 4 (MF_PLT_CLK3) on INT33FF:03
[    0.963794] pinctrl core: registered pin 5 (PWM0) on INT33FF:03
[    0.963797] pinctrl core: registered pin 6 (MF_PLT_CLK5) on INT33FF:03
[    0.963802] pinctrl core: registered pin 7 (MF_PLT_CLK2) on INT33FF:03
[    0.963805] pinctrl core: registered pin 15 (SDMMC2_D3_CD_B) on INT33FF:=
03
[    0.963808] pinctrl core: registered pin 16 (SDMMC1_CLK) on INT33FF:03
[    0.963811] pinctrl core: registered pin 17 (SDMMC1_D0) on INT33FF:03
[    0.963814] pinctrl core: registered pin 18 (SDMMC2_D1) on INT33FF:03
[    0.963817] pinctrl core: registered pin 19 (SDMMC2_CLK) on INT33FF:03
[    0.963821] pinctrl core: registered pin 20 (SDMMC1_D2) on INT33FF:03
[    0.963824] pinctrl core: registered pin 21 (SDMMC2_D2) on INT33FF:03
[    0.963827] pinctrl core: registered pin 22 (SDMMC2_CMD) on INT33FF:03
[    0.963830] pinctrl core: registered pin 23 (SDMMC1_CMD) on INT33FF:03
[    0.963833] pinctrl core: registered pin 24 (SDMMC1_D1) on INT33FF:03
[    0.963836] pinctrl core: registered pin 25 (SDMMC2_D0) on INT33FF:03
[    0.963839] pinctrl core: registered pin 26 (SDMMC1_D3_CD_B) on INT33FF:=
03
[    0.963842] pinctrl core: registered pin 30 (SDMMC3_D1) on INT33FF:03
[    0.963846] pinctrl core: registered pin 31 (SDMMC3_CLK) on INT33FF:03
[    0.963849] pinctrl core: registered pin 32 (SDMMC3_D3) on INT33FF:03
[    0.963852] pinctrl core: registered pin 33 (SDMMC3_D2) on INT33FF:03
[    0.963855] pinctrl core: registered pin 34 (SDMMC3_CMD) on INT33FF:03
[    0.963858] pinctrl core: registered pin 35 (SDMMC3_D0) on INT33FF:03
[    0.963865] pinctrl core: registered pin 45 (MF_LPC_AD2) on INT33FF:03
[    0.963869] pinctrl core: registered pin 46 (LPC_CLKRUNB) on INT33FF:03
[    0.963872] pinctrl core: registered pin 47 (MF_LPC_AD0) on INT33FF:03
[    0.963875] pinctrl core: registered pin 48 (LPC_FRAMEB) on INT33FF:03
[    0.963878] pinctrl core: registered pin 49 (MF_LPC_CLKOUT1) on INT33FF:=
03
[    0.963882] pinctrl core: registered pin 50 (MF_LPC_AD3) on INT33FF:03
[    0.963885] pinctrl core: registered pin 51 (MF_LPC_CLKOUT0) on INT33FF:=
03
[    0.963888] pinctrl core: registered pin 52 (MF_LPC_AD1) on INT33FF:03
[    0.963891] pinctrl core: registered pin 60 (SPI1_MISO) on INT33FF:03
[    0.963894] pinctrl core: registered pin 61 (SPI1_CSO_B) on INT33FF:03
[    0.963898] pinctrl core: registered pin 62 (SPI1_CLK) on INT33FF:03
[    0.963901] pinctrl core: registered pin 63 (MMC1_D6) on INT33FF:03
[    0.963904] pinctrl core: registered pin 64 (SPI1_MOSI) on INT33FF:03
[    0.963908] pinctrl core: registered pin 65 (MMC1_D5) on INT33FF:03
[    0.963911] pinctrl core: registered pin 66 (SPI1_CS1_B) on INT33FF:03
[    0.963925] pinctrl core: registered pin 67 (MMC1_D4_SD_WE) on INT33FF:03
[    0.963929] pinctrl core: registered pin 68 (MMC1_D7) on INT33FF:03
[    0.963932] pinctrl core: registered pin 69 (MMC1_RCLK) on INT33FF:03
[    0.963935] pinctrl core: registered pin 75 (USB_OC1_B) on INT33FF:03
[    0.963938] pinctrl core: registered pin 76 (PMU_RESETBUTTON_B) on INT33=
FF:03
[    0.963941] pinctrl core: registered pin 77 (GPIO_ALERT) on INT33FF:03
[    0.963945] pinctrl core: registered pin 78 (SDMMC3_PWR_EN_B) on INT33FF=
:03
[    0.963948] pinctrl core: registered pin 79 (ILB_SERIRQ) on INT33FF:03
[    0.963951] pinctrl core: registered pin 80 (USB_OC0_B) on INT33FF:03
[    0.963954] pinctrl core: registered pin 81 (SDMMC3_CD_B) on INT33FF:03
[    0.963957] pinctrl core: registered pin 82 (SPKR) on INT33FF:03
[    0.963960] pinctrl core: registered pin 83 (SUSPWRDNACK) on INT33FF:03
[    0.963963] pinctrl core: registered pin 84 (SPARE_PIN) on INT33FF:03
[    0.963967] pinctrl core: registered pin 85 (SDMMC3_1P8_EN) on INT33FF:03
[    0.963971] cherryview-pinctrl INT33FF:03: failed to lookup the default =
state
[    0.963975] cherryview-pinctrl INT33FF:03: failed to lookup the sleep st=
ate
[    0.964927] ACPI: Enabled 9 GPEs in block 00 to 3F
[    0.992749] dw_dmac INTL9C60:00: DesignWare DMA Controller, 8 channels
[    1.022513] dw_dmac INTL9C60:01: DesignWare DMA Controller, 8 channels
[    1.030172] vgaarb: setting as boot device: PCI:0000:00:02.0
[    1.036506] vgaarb: device added: PCI:0000:00:02.0,decodes=3Dio+mem,owns=
=3Dio+mem,locks=3Dnone
[    1.045570] vgaarb: loaded
[    1.048603] vgaarb: bridge control possible 0000:00:02.0
[    1.054770] SCSI subsystem initialized
[    1.059092] libata version 3.00 loaded.
[    1.059163] ACPI: bus type USB registered
[    1.063710] usbcore: registered new interface driver usbfs
[    1.069881] usbcore: registered new interface driver hub
[    1.075870] usbcore: registered new device driver usb
[    1.081830] PCI: Using ACPI for IRQ routing
[    1.089190] PCI: pci_cache_line_size set to 64 bytes
[    1.089401] e820: reserve RAM buffer [mem 0x0006f000-0x0006ffff]
[    1.089406] e820: reserve RAM buffer [mem 0x00086000-0x0008ffff]
[    1.089409] e820: reserve RAM buffer [mem 0x73671018-0x73ffffff]
[    1.089412] e820: reserve RAM buffer [mem 0x79b79000-0x7bffffff]
[    1.089416] e820: reserve RAM buffer [mem 0x7b442000-0x7bffffff]
[    1.089725] NetLabel: Initializing
[    1.093537] NetLabel:  domain hash size =3D 128
[    1.098415] NetLabel:  protocols =3D UNLABELED CIPSOv4
[    1.103999] NetLabel:  unlabeled traffic allowed by default
[    1.110404] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    1.115900] hpet0: 3 comparators, 64-bit 14.318180 MHz counter
[    1.124493] clocksource: Switched to clocksource hpet
[    1.150986] VFS: Disk quotas dquot_6.6.0
[    1.155442] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    1.163445] pnp: PnP ACPI init
[    1.167119] system 00:00: [io  0x0680-0x069f] has been reserved
[    1.173763] system 00:00: [io  0x0400-0x047f] has been reserved
[    1.180398] system 00:00: [io  0x0500-0x05fe] has been reserved
[    1.187041] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.187241] pnp 00:01: Plug and Play ACPI device, IDs PNP0501 (active)
[    1.187339] pnp 00:02: Plug and Play ACPI device, IDs PNP0303 (active)
[    1.190149] system 00:03: [mem 0x91325000-0x91325fff] has been reserved
[    1.197573] system 00:03: [mem 0x91320000-0x91320fff] has been reserved
[    1.204986] system 00:03: [mem 0x9131e000-0x9131efff] has been reserved
[    1.212399] system 00:03: [mem 0x91323000-0x91323fff] has been reserved
[    1.219805] system 00:03: [mem 0x91321000-0x91321fff] has been reserved
[    1.227222] system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.227444] system 00:04: [mem 0xe0000000-0xefffffff] could not be reser=
ved
[    1.235251] system 00:04: [mem 0xfea00000-0xfeafffff] has been reserved
[    1.242665] system 00:04: [mem 0xfed01000-0xfed01fff] has been reserved
[    1.250068] system 00:04: [mem 0xfed03000-0xfed03fff] has been reserved
[    1.257482] system 00:04: [mem 0xfed06000-0xfed06fff] has been reserved
[    1.264895] system 00:04: [mem 0xfed08000-0xfed09fff] has been reserved
[    1.272308] system 00:04: [mem 0xfed80000-0xfedbffff] could not be reser=
ved
[    1.280099] system 00:04: [mem 0xfed1c000-0xfed1cfff] has been reserved
[    1.287513] system 00:04: [mem 0xfee00000-0xfeefffff] has been reserved
[    1.294924] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
[    1.295305] pnp 00:05: Plug and Play ACPI device, IDs PNP0b00 (active)
[    1.295649] pnp: PnP ACPI: found 6 devices
[    1.311182] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    1.321279] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to [bus =
01] add_size 1000
[    1.321288] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 01] add_size 200000 add_align 100000
[    1.321294] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff] =
to [bus 01] add_size 200000 add_align 100000
[    1.321434] pci 0000:00:1c.0: res[14]=3D[mem 0x00100000-0x000fffff] res_=
to_dev_res add_size 200000 min_align 100000
[    1.321439] pci 0000:00:1c.0: res[14]=3D[mem 0x00100000-0x002fffff] res_=
to_dev_res add_size 200000 min_align 100000
[    1.321444] pci 0000:00:1c.0: res[15]=3D[mem 0x00100000-0x000fffff 64bit=
 pref] res_to_dev_res add_size 200000 min_align 100000
[    1.321449] pci 0000:00:1c.0: res[15]=3D[mem 0x00100000-0x002fffff 64bit=
 pref] res_to_dev_res add_size 200000 min_align 100000
[    1.321454] pci 0000:00:1c.0: res[13]=3D[io  0x1000-0x0fff] res_to_dev_r=
es add_size 1000 min_align 1000
[    1.321459] pci 0000:00:1c.0: res[13]=3D[io  0x1000-0x1fff] res_to_dev_r=
es add_size 1000 min_align 1000
[    1.321474] pci 0000:00:1c.0: BAR 14: assigned [mem 0x91400000-0x915ffff=
f]
[    1.329191] pci 0000:00:1c.0: BAR 15: assigned [mem 0x91600000-0x917ffff=
f 64bit pref]
[    1.337971] pci 0000:00:1c.0: BAR 13: assigned [io  0x2000-0x2fff]
[    1.344903] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    1.350502] pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
[    1.357396] pci 0000:00:1c.0:   bridge window [mem 0x91400000-0x915fffff]
[    1.365047] pci 0000:00:1c.0:   bridge window [mem 0x91600000-0x917fffff=
 64bit pref]
[    1.373810] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    1.379442] pci 0000:00:1c.2:   bridge window [mem 0x91000000-0x910fffff]
[    1.387178] pci_bus 0000:00: resource 4 [io  0x0070-0x0077]
[    1.387183] pci_bus 0000:00: resource 5 [io  0x0000-0x006f window]
[    1.387187] pci_bus 0000:00: resource 6 [io  0x0078-0x0cf7 window]
[    1.387191] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[    1.387195] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff windo=
w]
[    1.387200] pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff windo=
w]
[    1.387204] pci_bus 0000:00: resource 10 [mem 0x000e0000-0x000fffff wind=
ow]
[    1.387208] pci_bus 0000:00: resource 11 [mem 0x80000000-0xdfffffff wind=
ow]
[    1.387212] pci_bus 0000:01: resource 0 [io  0x2000-0x2fff]
[    1.387217] pci_bus 0000:01: resource 1 [mem 0x91400000-0x915fffff]
[    1.387221] pci_bus 0000:01: resource 2 [mem 0x91600000-0x917fffff 64bit=
 pref]
[    1.387226] pci_bus 0000:02: resource 1 [mem 0x91000000-0x910fffff]
[    1.387334] NET: Registered protocol family 2
[    1.392743] TCP established hash table entries: 16384 (order: 5, 131072 =
bytes)
[    1.400958] TCP bind hash table entries: 16384 (order: 6, 262144 bytes)
[    1.408469] TCP: Hash tables configured (established 16384 bind 16384)
[    1.415850] UDP hash table entries: 1024 (order: 3, 32768 bytes)
[    1.422623] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
[    1.430002] NET: Registered protocol family 1
[    1.434936] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    1.446597] PCI: CLS 64 bytes, default 64
[    1.446757] Unpacking initramfs...
[   31.033914] Freeing initrd memory: 58280K (ffff88006e894000 - ffff880072=
17e000)
[   31.043910] futex hash table entries: 1024 (order: 4, 65536 bytes)
[   31.050922] audit: initializing netlink subsys (disabled)
[   31.057035] audit: type=3D2000 audit(1459455329.373:1): initialized
[   31.064731] Initialise system trusted keyring
[   31.069859] workingset: timestamp_bits=3D35 max_order=3D19 bucket_order=
=3D0
[   31.082989] Key type big_key registered
[   31.087307] SELinux:  Registering netfilter hooks
[   31.249846] NET: Registered protocol family 38
[   31.254879] Key type asymmetric registered
[   31.259506] Asymmetric key parser 'x509' registered
[   31.265152] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 251)
[   31.273541] io scheduler noop registered
[   31.277966] io scheduler deadline registered
[   31.282869] io scheduler cfq registered (default)
[   31.290180] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[   31.296448] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
[   31.303945] efifb: probing for efifb
[   31.307987] efifb: framebuffer at 0x80000000, mapped to 0xffffc900008000=
00, using 4128k, total 4128k
[   31.318223] efifb: mode is 1366x768x32, linelength=3D5504, pages=3D1
[   31.324953] efifb: scrolling: redraw
[   31.328965] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[   31.343691] Console: switching to colour frame buffer device 170x48
[   31.358395] fb0: EFI VGA frame buffer device
[   31.363258] intel_idle: MWAIT substates: 0x33000020
[   31.363262] intel_idle: v0.4.1 model 0x4C
[   31.363265] intel_idle: lapic_timer_reliable_states 0xffffffff
[   31.363675] ACPI: AC Adapter [ADP0] (on-line)
[   31.368828] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input0
[   31.378453] ACPI: Power Button [PWRB]
[   31.382716] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input1
[   31.392076] ACPI: Lid Switch [LID0]
[   31.396137] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input2
[   31.405607] ACPI: Sleep Button [SLPB]
[   31.409865] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input3
[   31.418245] ACPI: Power Button [PWRF]
[   31.425952] ACPI Error: [TCNT] Namespace lookup failure, AE_NOT_FOUND (2=
0160108/psargs-359)
[   31.435476] ACPI Error: Method parse/execution failed [\_TZ.TZ00._PSL] (=
Node ffff8800750b8730), AE_NOT_FOUND (20160108/psparse-542)
[   31.448963] ACPI: Invalid passive threshold
[   31.453743] ACPI: Invalid active0 threshold
[   31.458832] thermal LNXTHERM:01: registered as thermal_zone0
[   31.465247] ACPI: Thermal Zone [TZ01] (60 C)
[   31.470199] GHES: HEST is not enabled!
[   31.474671] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[   31.475735] ACPI: Battery Slot [BAT0] (battery present)
[   31.513803] 00:01: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) =
is a 16550A
[   31.526035] Non-volatile memory driver v1.3
[   31.533700] Linux agpgart interface v0.103
[   31.542152] libphy: Fixed MDIO Bus: probed
[   31.549735] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   31.559903] ehci-pci: EHCI PCI platform driver
[   31.567721] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[   31.577501] ohci-pci: OHCI PCI platform driver
[   31.585344] uhci_hcd: USB Universal Host Controller Interface driver
[   31.595700] xhci_hcd 0000:00:14.0: xHCI Host Controller
[   31.604505] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 1
[   31.616828] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x1=
00 quirks 0x00509810
[   31.629170] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[   31.629357] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
[   31.639889] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[   31.650939] usb usb1: Product: xHCI Host Controller
[   31.659337] usb usb1: Manufacturer: Linux 4.6.0-rc1 xhci-hcd
[   31.668608] usb usb1: SerialNumber: 0000:00:14.0
[   31.676975] hub 1-0:1.0: USB hub found
[   31.684072] hub 1-0:1.0: 7 ports detected
[   31.692723] xhci_hcd 0000:00:14.0: xHCI Host Controller
[   31.701485] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 2
[   31.712713] usb usb2: No SuperSpeed endpoint companion for config 1  int=
erface 0 altsetting 0 ep 129: using minimum values
[   31.728049] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003
[   31.738578] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[   31.749589] usb usb2: Product: xHCI Host Controller
[   31.757976] usb usb2: Manufacturer: Linux 4.6.0-rc1 xhci-hcd
[   31.767196] usb usb2: SerialNumber: 0000:00:14.0
[   31.775510] hub 2-0:1.0: USB hub found
[   31.782529] hub 2-0:1.0: 6 ports detected
[   31.791201] usbcore: registered new interface driver usbserial
[   31.800642] usbcore: registered new interface driver usbserial_generic
[   31.810625] usbserial: USB Serial support registered for generic
[   31.820047] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
[   31.830275] i8042: PNP: PS/2 appears to have AUX port disabled, if this =
is incorrect please boot with i8042.nopnp
[   31.845512] serio: i8042 KBD port at 0x60,0x64 irq 1
[   31.853897] mousedev: PS/2 mouse device common for all mice
[   31.863473] rtc_cmos 00:05: RTC can wake from S4
[   31.871677] rtc_cmos 00:05: rtc core: registered rtc_cmos as rtc0
[   31.881150] rtc_cmos 00:05: alarms up to one month, y3k, 242 bytes nvram=
, hpet irqs
[   31.892773] device-mapper: uevent: version 1.0.3
[   31.901270] device-mapper: ioctl: 4.34.0-ioctl (2015-10-28) initialised:=
 dm-devel@redhat.com
[   31.914251] Intel P-state driver initializing.
[   31.923093] EFI Variables Facility v0.08 2004-May-17
[   31.926976] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input4
[   31.964157] hidraw: raw HID events driver (C) Jiri Kosina
[   31.972472] usbcore: registered new interface driver usbhid
[   31.980728] usbhid: USB HID core driver
[   31.987153] drop_monitor: Initializing network drop monitor service
[   31.996293] ip_tables: (C) 2000-2006 Netfilter Core Team
[   32.004482] Initializing XFRM netlink socket
[   32.011595] NET: Registered protocol family 10
[   32.019742] mip6: Mobile IPv6
[   32.025199] NET: Registered protocol family 17
[   32.033515] microcode: CPU0 sig=3D0x406c3, pf=3D0x1, revision=3D0x34f
[   32.042359] microcode: CPU1 sig=3D0x406c3, pf=3D0x1, revision=3D0x34f
[   32.057617] tsc: Refined TSC clocksource calibration: 1599.999 MHz
[   32.058987] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[   32.067203] microcode: Microcode Update Driver: v2.01 <tigran@aivazian.f=
snet.co.uk>, Peter Oruba
[   32.067317] SSE version of gcm_enc/dec engaged.
[   32.094736] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x171=
023f09ff, max_idle_ns: 440795233615 ns
[   32.234732] registered taskstats version 1
[   32.241499] Loading compiled-in X.509 certificates
[   32.250327] usb 1-1: New USB device found, idVendor=3D0930, idProduct=3D=
6545
[   32.259975] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   32.270041] usb 1-1: Product: DataTraveler 2.0
[   32.277047] usb 1-1: Manufacturer: Kingston
[   32.283745] usb 1-1: SerialNumber: 001E4FB76AFCED301788020B
[   32.304960] alg: No test for pkcs1pad(rsa,sha256) (pkcs1pad(rsa-generic,=
sha256))
[   32.318063] Loaded X.509 cert 'Build time autogenerated kernel key: f285=
d2e5fabfd5889c4db4f4121541d542f6a381'
[   32.338646] zswap: default zpool zbud not available
[   32.346263] zswap: pool creation failed
[   32.354258]   Magic number: 8:154:297
[   32.361159] rtc_cmos 00:05: setting system clock to 2016-03-31 20:15:33 =
UTC (1459455333)
[   32.372636] PM: Hibernation image not present or could not be loaded.
[   32.375473] Freeing unused kernel memory: 1512K (ffffffff81d3d000 - ffff=
ffff81eb7000)
[   32.386495] Write protecting the kernel read-only data: 12288k
[   32.396082] Freeing unused kernel memory: 704K (ffff880001750000 - ffff8=
80001800000)
[   32.407041] usb 1-3: new high-speed USB device number 3 using xhci_hcd
[   32.431758] Freeing unused kernel memory: 1000K (ffff880001b06000 - ffff=
880001c00000)
[   32.527477] udevd[128]: starting version 1.9
[   32.535136] random: udevd urandom read with 4 bits of entropy available
[   32.545508] udevd[128]: specified group 'input' unknown
[   32.582041] usb 1-3: New USB device found, idVendor=3D0bda, idProduct=3D=
0129
[   32.591716] usb 1-3: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   32.601835] usb 1-3: Product: USB2.0-CRW
[   32.608338] usb 1-3: Manufacturer: Generic
[   32.615013] usb 1-3: SerialNumber: 20100201396000000
[   32.661107] sdhci: Secure Digital Host Controller Interface driver
[   32.670188] sdhci: Copyright(c) Pierre Ossman
[   32.747989] mmc0: SDHCI controller on ACPI [80860F14:00] using ADMA
[   32.783267] 8086228A:01: ttyS1 at MMIO 0x9131f000 (irq =3D 40, base_baud=
 =3D 2764800) is a 16550A
[   32.852310] usb 1-4: new high-speed USB device number 4 using xhci_hcd
[   32.878917] wmi: Mapper loaded
[   33.007423] ACPI Warning: SystemIO range 0x0000000000001040-0x0000000000=
00105F conflicts with OpRegion 0x0000000000001040-0x000000000000104F (\_SB.=
PCI0.SBUS.SMBI) (20160108/utaddress-255)
[   33.030849] ACPI: If an ACPI driver is available for this device, you sh=
ould use it instead of the native driver
[   33.073386] [drm] Initialized drm 1.1.0 20060810
[   33.134320] clocksource: Switched to clocksource tsc
[   33.143880] mmc0: new HS200 MMC card at address 0001
[   33.165446] usb 1-4: New USB device found, idVendor=3D064e, idProduct=3D=
9404
[   33.175363] usb 1-4: New USB device strings: Mfr=3D3, Product=3D1, Seria=
lNumber=3D2
[   33.185697] usb 1-4: Product: VGA Webcam
[   33.192438] usb 1-4: Manufacturer: SuYin
[   33.199166] usb 1-4: SerialNumber: HF031A-T803-SE02-REV0100
[   33.208327] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[   33.224124] hid-rmi 0018:06CB:74A3.0001: Scanning PDT...
[   33.247295] iTCO_vendor_support: vendor-support=3D0
[   33.273377] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[   33.285161] iTCO_wdt: unable to reset NO_REBOOT flag, device disabled by=
 hardware/BIOS
[   33.297039] mmcblk0: mmc0:0001 HBG4e=05 29.1 GiB=20
[   33.304562] mmcblk0boot0: mmc0:0001 HBG4e=05 partition 1 4.00 MiB
[   33.313645] mmcblk0boot1: mmc0:0001 HBG4e=05 partition 2 4.00 MiB
[   33.322601] mmcblk0rpmb: mmc0:0001 HBG4e=05 partition 3 4.00 MiB
[   33.445108]  mmcblk0: p1 p2 p3 p4
[   33.767136] hid-rmi 0018:06CB:74A3.0001: Found F34 on page 0x00
[   33.830122] usb 1-5: new full-speed USB device number 5 using xhci_hcd
[   33.842478] hid-rmi 0018:06CB:74A3.0001: Found F01 on page 0x00
[   33.852911] [drm] Memory usable by graphics device =3D 2048M
[   33.862938] checking generic (80000000 408000) vs hw (80000000 10000000)
[   33.862943] fb: switching to inteldrmfb from EFI VGA
[   33.870951] Console: switching to colour dummy device 80x25
[   33.878213] [drm] Replacing VGA console driver
[   33.883817] hid-rmi 0018:06CB:74A3.0001: Found F11 on page 0x00
[   33.884628] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   33.884629] [drm] Driver supports precise vblank timestamp query.
[   33.911658] hid-rmi 0018:06CB:74A3.0001: Found F54 on page 0x01
[   33.920936] hid-rmi 0018:06CB:74A3.0001: Found F30 on page 0x01
[   33.933942] hid-rmi 0018:06CB:74A3.0001: rmi_scan_pdt: Done with PDT sca=
n.
[   33.967627] usb 1-5: New USB device found, idVendor=3D8087, idProduct=3D=
07dc
[   33.975164] usb 1-5: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D0
[   33.982619] vgaarb: device changed decodes: PCI:0000:00:02.0,olddecodes=
=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
[   34.000637] hid-rmi 0018:06CB:74A3.0001: rmi_populate_f11: size in mm: 1=
02 x 57
[   34.043589] usb-storage 1-1:1.0: USB Mass Storage device detected
[   34.050706] scsi host0: usb-storage 1-1:1.0
[   34.055695] usbcore: registered new interface driver usb-storage
[   34.069746] hid-rmi 0018:06CB:74A3.0001: firmware id: 1974191
[   34.076431] input: SYN1B82:00 06CB:74A3 as /devices/pci0000:00/808622C1:=
00/i2c-0/i2c-SYN1B82:00/0018:06CB:74A3.0001/input/input5
[   34.089836] hid-rmi 0018:06CB:74A3.0001: input,hidraw0: I2C HID v1.00 Mo=
use [SYN1B82:00 06CB:74A3] on i2c-SYN1B82:00
[   34.308702] fbcon: inteldrmfb (fb0) is primary device
[   35.062563] scsi 0:0:0:0: Direct-Access     Kingston DataTraveler 2.0 PM=
AP PQ: 0 ANSI: 4
[   35.065280] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   35.066700] sd 0:0:0:0: [sda] 30489408 512-byte logical blocks: (15.6 GB=
/14.5 GiB)
[   35.069511] sd 0:0:0:0: [sda] Write Protect is off
[   35.069527] sd 0:0:0:0: [sda] Mode Sense: 23 00 00 00
[   35.069851] sd 0:0:0:0: [sda] No Caching mode page found
[   35.069857] sd 0:0:0:0: [sda] Assuming drive cache: write through
[   35.073488]  sda: sda1 sda2
[   35.075918] sd 0:0:0:0: [sda] Attached SCSI removable disk
[   35.579840] Console: switching to colour frame buffer device 170x48
[   35.590615] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: n=
o)
[   35.591804] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/LNXVIDEO:00/input/input6
[   35.592093] [drm] Initialized i915 1.6.0 20160229 for 0000:00:02.0 on mi=
nor 0
[   35.888484] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops i915_aud=
io_component_bind_ops [i915])
[   36.009122] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[   36.016631] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC233: li=
ne_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[   36.028647] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[   36.037582] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D1 (0x21/0x0/=
0x0/0x0/0x0)
[   36.046122] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=3D0x0
[   36.053293] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[   36.059404] snd_hda_codec_realtek hdaudioC0D0:      Mic=3D0x12
[   36.111560] input: HDA Intel PCH Front Headphone as /devices/pci0000:00/=
0000:00:1b.0/sound/card0/input7
[   36.123467] input: HDA Intel PCH HDMI/DP,pcm=3D3 as /devices/pci0000:00/=
0000:00:1b.0/sound/card0/input8
[   49.624427] random: nonblocking pool is initialized

--vtzGhvizbBRQ85DL--
