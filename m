From: Colin Pitrat <colin.pitrat@gmail.com>
Subject: Re: [PATCH] gpio: sch: Fix Oops on module load on Asus Eee PC 1201
Date: Mon, 9 May 2016 20:37:57 +0100
Message-ID: <20160509192652.GA1320@pitrat4.localdomain>
References: <20160506214917.GA1691@pitrat4.localdomain>
 <20160509070245.GJ15974@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160509070245.GJ15974@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, rebecca.swee.fun.chang@intel.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon, May 09, 2016 at 10:02:45AM +0300, Mika Westerberg wrote:
> Can you include the oops log in the changelog as well?

The oops is the following:

[   13.753278] BUG: unable to handle kernel NULL pointer dereference at 00000094
[   13.755532] IP: [<f834c241>] sch_gpio_probe+0x161/0x280 [gpio_sch]
[   13.755532] *pde = 00000000
[   13.755532] Oops: 0000 [#1] PREEMPT SMP
[   13.755532] Modules linked in: gpio_sch(+) atl1c snd_hda_intel snd_hda_codec sparse_keymap led_class thermal rfkill snd_hda_core snd_hwdep i8042 fjes snd_pcm serio wmi acpi_cpufreq evdev snd_timer battery snd soundcore mac_hid button ac shpchp lpc_sch tpm_tis tpm processor sch_fq_codel ip_tables x_tables reiserfs uvesafb sd_mod ata_generic pata_acpi pata_sch libata scsi_mod ehci_pci uhci_hcd ehci_hcd usbcore usb_common gma500_gfx video i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
[   13.755532] CPU: 1 PID: 240 Comm: systemd-udevd Not tainted 4.5.1-1-ARCH #1
[   13.755532] Hardware name: ASUSTeK Computer INC. 1201HA/1201HA, BIOS 0302    02/05/2010
[   13.755532] task: f4cef500 ti: f4db0000 task.ti: f4db0000
[   13.755532] EIP: 0060:[<f834c241>] EFLAGS: 00010246 CPU: 1
[   13.755532] EIP is at sch_gpio_probe+0x161/0x280 [gpio_sch]
[   13.755532] EAX: 0000000a EBX: f55609cc ECX: 00000000 EDX: 0000000e
[   13.755532] ESI: f834d0cc EDI: 00000000 EBP: f4db1cb4 ESP: f4db1c98
[   13.755532]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
[   13.755532] CR0: 80050033 CR2: 00000094 CR3: 34da5000 CR4: 000006d0
[   13.755532] Stack:
[   13.755532]  00000040 c008d3b0 c008d20c c008d200 c008d20c f834e014 c008d20c f4db1cd0
[   13.755532]  c1387b13 f4db1cd0 c13850e2 c008d20c 00000000 f834e014 f4db1d04 c1385b49
[   13.755532]  00000000 f4db1cf0 c130a6ac c008d20c f834e014 00000000 f4db1d04 00000022
[   13.755532] Call Trace:
[   13.755532]  [<c1387b13>] platform_drv_probe+0x43/0xb0
[   13.755532]  [<c13850e2>] ? driver_sysfs_add+0x62/0x80
[   13.755532]  [<c1385b49>] driver_probe_device+0x1f9/0x450
[   13.755532]  [<c130a6ac>] ? acpi_driver_match_device+0x31/0x4b
[   13.755532]  [<c1385e19>] __driver_attach+0x79/0x80
[   13.755532]  [<c1385da0>] ? driver_probe_device+0x450/0x450
[   13.755532]  [<c13839a7>] bus_for_each_dev+0x57/0xa0
[   13.755532]  [<c13852be>] driver_attach+0x1e/0x20
[   13.755532]  [<c1385da0>] ? driver_probe_device+0x450/0x450
[   13.755532]  [<c1384dcf>] bus_add_driver+0x1ef/0x290
[   13.755532]  [<f815d000>] ? 0xf815d000
[   13.755532]  [<f815d000>] ? 0xf815d000
[   13.755532]  [<c138670d>] driver_register+0x5d/0xf0
[   13.755532]  [<c1387a7f>] __platform_driver_register+0x2f/0x40
[   13.755532]  [<f815d012>] sch_gpio_driver_init+0x12/0x1000 [gpio_sch]
[   13.755532]  [<c100047a>] do_one_initcall+0xaa/0x200
[   13.755532]  [<f815d000>] ? 0xf815d000
[   13.755532]  [<c115f525>] ? kvfree+0x45/0x50
[   13.755532]  [<c11938be>] ? kmem_cache_alloc_trace+0x7e/0x1f0
[   13.755532]  [<c1140fe9>] ? do_init_module+0x21/0x1a8
[   13.755532]  [<c1140fe9>] ? do_init_module+0x21/0x1a8
[   13.755532]  [<c1141018>] do_init_module+0x50/0x1a8
[   13.755532]  [<c10e1cfc>] load_module+0x204c/0x25b0
[   13.755532]  [<c10e2387>] SyS_init_module+0x127/0x180
[   13.755532]  [<c1001b3d>] do_fast_syscall_32+0x8d/0x150
[   13.755532]  [<c150b187>] sysenter_past_esp+0x40/0x61
[   13.755532] Code: ff ff 5b 5e 5f 5d c3 8d 76 00 8b 7b 10 31 c0 ba 0e 00 00 00 66 89 83 92 00 00 00 b8 0a 00 00 00 66 89 53 4c 66 89 83 94 00 00 00 <0f> b7 b7 94 00 00 00 83 fe 08 0f 87 df 00 00 00 b9 08 00 00 00
[   13.755532] EIP: [<f834c241>] sch_gpio_probe+0x161/0x280 [gpio_sch] SS:ESP 0068:f4db1c98
[   13.755532] CR2: 0000000000000094
[   14.100430] ---[ end trace 6e7a6fbbc3457766 ]---
