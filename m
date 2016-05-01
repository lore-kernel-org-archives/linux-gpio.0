From: Anatol Pomozov <anatol.pomozov@gmail.com>
Subject: NULL pointer dereference when 'rmmod gpio_lynxpoint'
Date: Sat, 30 Apr 2016 17:33:51 -0700
Message-ID: <CAOMFOmXMJ47HQrc4vVXF1+JbxHmH78HTncnnUHfzseCs47EQ6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:36128 "EHLO
	mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751257AbcEAAdx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Apr 2016 20:33:53 -0400
Received: by mail-io0-f175.google.com with SMTP id u185so163471360iod.3
        for <linux-gpio@vger.kernel.org>; Sat, 30 Apr 2016 17:33:52 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: dewangan@nvidia.com, Linus Walleij <linus.walleij@linaro.org>

Hi

I am trying to 'rmmod gpio_lynxpoint' module at my Chromebox with Arch
4.5.1 kernel and get this oops:

[  118.801173] BUG: unable to handle kernel NULL pointer dereference
at 0000000000000078
[  118.801228] IP: [<ffffffff8105401f>] apic_ack_edge+0x2f/0x60
[  118.801267] PGD 74193067 PUD 74192067 PMD 0
[  118.801297] Oops: 0000 [#1] PREEMPT SMP
[  118.801326] Modules linked in: rfcomm snd_hda_codec_hdmi intel_rapl
arc4 x86_pkg_temp_thermal intel_powerclamp coretemp ath9k kvm_intel
ath9k_common kvm ath9k_hw irqbypass iTCO_wdt iTCO_vendor_support evdev
mac_hid ath crct10dif_pclmul crc32_pclmul mac80211 crc32c_intel
ghash_clmulni_intel cryptd i915 snd_hda_codec_realtek ath3k btusb
snd_hda_codec_generic btrtl drm_kms_helper btbcm snd_hda_intel btintel
pcspkr bluetooth cfg80211 snd_hda_codec i2c_i801 drm snd_hda_core
intel_gtt syscopyarea sysfillrect sysimgblt lpc_ich fb_sys_fops
dw_dmac snd_hwdep i2c_algo_bit rfkill r8169 snd_pcm mei_me mii
dw_dmac_core snd_timer mei snd soundcore shpchp tpm_tis fan tpm fjes
8250_dw i2c_designware_platform gpio_lynxpoint(-) spi_pxa2xx_platform
i2c_designware_core video thermal button processor sch_fq_codel
ip_tables
[  118.801846]  x_tables ext4 crc16 mbcache jbd2 sd_mod ahci libahci
sdhci_acpi libata sdhci led_class mmc_core scsi_mod xhci_pci xhci_hcd
usbcore usb_common
[  118.801952] CPU: 1 PID: 368 Comm: rmmod Not tainted 4.5.1-1-ARCH #1
[  118.801988] Hardware name: Google Panther/Panther, BIOS MattDevo 04/03/2016
[  118.802027] task: ffff88006acfa7c0 ti: ffff8800629c4000 task.ti:
ffff8800629c4000
[  118.802068] RIP: 0010:[<ffffffff8105401f>]  [<ffffffff8105401f>]
apic_ack_edge+0x2f/0x60
[  118.802119] RSP: 0018:ffff8800629c7d60  EFLAGS: 00010046
[  118.802150] RAX: 0000000000000000 RBX: ffff880100500fc0 RCX: 0000000000000000
[  118.802189] RDX: ffff880100500fc0 RSI: 0000000000000046 RDI: ffff880100500280
[  118.802228] RBP: ffff8800629c7d68 R08: 0000000000000000 R09: ffff880100000000
[  118.802267] R10: 0000000000000000 R11: ffff880073ecac20 R12: ffff88010043e428
[  118.802308] R13: 0000000000000001 R14: 0000000000000000 R15: 0000000001ccf010
[  118.802349] FS:  00007f7a78de7700(0000) GS:ffff880100300000(0000)
knlGS:0000000000000000
[  118.802394] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  118.802425] CR2: 0000000000000078 CR3: 0000000074190000 CR4: 00000000000406e0
[  118.802464] Stack:
[  118.802477]  ffff88010043e400 ffff8800629c7d78 ffffffff810d4c24
ffff8800629c7da8
[  118.802524]  ffffffff810d5af9 0000000000000000 0000000100000000
ffff88010043e400
[  118.802571]  0000000000000000 ffff8800629c7de8 ffffffff810d5b65
0000000000000246
[  118.802618] Call Trace:
[  118.802639]  [<ffffffff810d4c24>] irq_chip_ack_parent+0x14/0x20
[  118.802674]  [<ffffffff810d5af9>] __irq_do_set_handler+0x159/0x170
[  118.802710]  [<ffffffff810d5b65>] __irq_set_handler+0x55/0x90
[  118.802747]  [<ffffffff81311d7f>] gpiochip_remove+0x18f/0x1e0
[  118.802782]  [<ffffffffa0101397>] lp_gpio_remove+0x27/0x30 [gpio_lynxpoint]
[  118.802822]  [<ffffffff81402b78>] platform_drv_remove+0x28/0x40
[  118.802860]  [<ffffffff81400281>] __device_release_driver+0xa1/0x160
[  118.802898]  [<ffffffff81400e14>] driver_detach+0xb4/0xc0
[  118.802930]  [<ffffffff813ffc25>] bus_remove_driver+0x55/0xd0
[  118.802964]  [<ffffffff8140167c>] driver_unregister+0x2c/0x50
[  118.802997]  [<ffffffff81402c42>] platform_driver_unregister+0x12/0x20
[  118.803035]  [<ffffffffa010182b>] lp_gpio_exit+0x10/0x7e5 [gpio_lynxpoint]
[  118.803074]  [<ffffffff810fdbb1>] SyS_delete_module+0x1b1/0x260
[  118.803109]  [<ffffffff8100364e>] ? exit_to_usermode_loop+0x5e/0xc0
[  118.803146]  [<ffffffff815ad6ae>] entry_SYSCALL_64_fastpath+0x12/0x6d
[  118.803182] Code: 00 55 48 85 ff 48 89 e5 53 48 89 fb 74 47 48 89
fa eb 03 48 89 c2 48 8b 42 28 48 85 c0 75 f4 48 8b 7a 30 65 48 8b 05
a9 70 fb 7e <48> 8b 70 78 f7 d6 e8 86 f9 ff ff 48 89 df e8 1e 4d 08 00
48 8b
[  118.803396] RIP  [<ffffffff8105401f>] apic_ack_edge+0x2f/0x60
[  118.805687]  RSP <ffff8800629c7d60>
[  118.807981] CR2: 0000000000000078
[  118.823530] ---[ end trace 540a61ea62273024 ]---
[  118.823534] note: rmmod[368] exited with preempt_count 1
