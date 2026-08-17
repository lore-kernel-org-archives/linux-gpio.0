Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469443B5847
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 07:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950280; cv=none; b=DapOf2FIOr+Qym4m0IN8YDpE8AK0Ysq6RlRwdla7Qw7HjioytDvPiTRan4Vjx/ekwTVfe2D9fUrBetkQsDyJz67Dk876Qng6BLy8Q85tW2fsjk0MSTDJkNHFKYORauWMfJ/giuJmEbQUKIGM9PJLQuR+xzEcU0h3ktmgq0pfd9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950280; c=relaxed/simple;
	bh=bmerHmZ1rUOl9XUdBMhpVrV21dgqF5inNvCTcwO2eJA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jWpSAYhEQMVdrwYSel/x4sMS30WTeRqv/9oWPsxteheLB9l3Pr/VEDOmtbvjTgmmR5MDZov91QygCinpE3mop2h1HPkunWeF7s/9YxG/NUalqB86UZHqYfLM08rLImIDusDB6PdoMildZSPxZWhmP4sS/WIkIC4q45CFkPq9tm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apT7e1qg; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apT7e1qg"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2237277a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 00:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786950278; x=1787555078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wr6LqarL8GyAx9pok5vjIl5ehc68aRE6BmpJkaxnmU=;
        b=apT7e1qgh9UTheaoj8mXFQpRbYhhNMdPapgos8cemsEUPM21/rAfGRwjYOpmeueP1R
         rkSWUJSCyOFSuygumeTZlFQQ/kBn62eFPXyGYWnn/QU7jVP3/3taZwCZcghmNU1E298G
         5VS+MFniIUutfEedPngTpoUuOsXlwb0kXKCEfqNeWKZd5s5cBmd85gltoLr/2DLucmxX
         E1ju1kN5piRZOKMKi8Hr3CKRirxvc78vhwCR6sQ2fmNshf63mwALV6kwjaZrp5BGhbQu
         asED1HMhYTbLeVSAUGx5FwrTuNFl/++VRXc64VQkpwAarM+sMw/hlMLohHWGpuHnkPrK
         odrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786950278; x=1787555078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wr6LqarL8GyAx9pok5vjIl5ehc68aRE6BmpJkaxnmU=;
        b=FtkveWz4U7AXcqQKrsNmzlkuhsofO2lXHD9Xw5oj9bFpHzEBX5Yz89k3E+2+2kY40S
         AYeb+1KQ0cSe6zQo2yVZI3VARCVfFA/mfhQ+8DI2bDO8htLbkzWLceciBoXty647JvEa
         XtT+gDAnYTQsVGMYLqbjWFwP0MlRuYxRdNPlRNZKRzcB6cPkoWA8tgLEZ8ptlc+t591E
         vVYPmdPvrexVNoja1Oqamv9dDIcJvY2ALYDu86U9sDjU7OUhHeX2SZfeSZ/hxytzYhtR
         /3RrC9yHtHa+ipHNoQW2ZraOq6hQPGHXWdL6/uWl01MbHPOoTPDqjTcWrFqOv9/qpPce
         u3dA==
X-Gm-Message-State: AOJu0Yyfb1/FtAvfqhxsDvnv50/tG29y7SNN4c4LSQPj4Bjl3Dz2gPQq
	iCJp2mapgcd0fYJqXRrIdhYqQhAys5Y5dpdPQq9TheB9mHGVV+Q/3yCyNiY4Z8OD
X-Gm-Gg: AR+sD10ct+rrObwBIwdBEbvhFnl2CJO5G/MUropXMvePMDBgKfs9FbukMQhr4u6BccW
	IyVNynqFB0NUF+d0/vfMkfBphFxqnbJ888hjhqL8FH684ooBBXI80k66QACzsRRu1uqyK/0brjS
	45U78w8jCwwcAUKBAYJVKNvQ9CQvXbmkNO/u+l8pHSo1x7QW83H9IovekCPXn2MY0dblFNUGIRU
	nxuWllJJ6oinwjQK4IeeI6A8GTHxgSKSVD4hHZjQA4Xv7FpTyPVyjoFtKzelYelsjLlUJy8EPLc
	ZS9H+ufSE6XRq224CHeE3Rk70T0vwoKpgbevIfUQGwhuf8RItm/zVPTLRWAluj0AqQkOioGhzRw
	Nc//WfFie3uLqBzlF8FU/zzgUs9i/P+4eX5cBC7qk5XG/DI3xweYYrjfRHs6OxtHDvBKNgMCsc6
	5JTCSPiDJRb9Wc3rt71EJ2yJd9y+ITGxvuYxWm78n4KLguY61+aXFt
X-Received: by 2002:a17:90b:3d48:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3933b8939dfmr24827999a91.12.1786950278025;
        Mon, 17 Aug 2026 00:04:38 -0700 (PDT)
Received: from jia ([188.253.12.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d562dd0007sm11738025ad.38.2026.08.17.00.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:04:37 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	warthog618@gmail.com,
	linusw@kernel.org,
	info@metux.net,
	vireshk@kernel.org,
	virtualization@lists.linux.dev
Subject: [BUG] gpio: cdev: irq_desc UAF on close after chip removal
Date: Mon, 17 Aug 2026 15:04:29 +0800
Message-Id: <20260817070429.157993-1-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I hit a KASAN slab-use-after-free in the gpio cdev close path while
playing with virtio-gpio unbind on x86-64/KVM (linux-next, KASAN guest).
The tree already has ec8b6f55b981 ("gpio: free irqs that are still
requested when the chip is being removed").

Repro is straightforward: request a v2 line with edge detection, unbind
the chip while the line fd is still open, and then close the fd.

==================================================================
BUG: KASAN: slab-use-after-free in _raw_spin_unlock_irqrestore+0x16/0x40
Write of size 1 at addr ffff88800bc9a914 by task gpio_uaf_repro/135

CPU: 1 UID: 0 PID: 135 Comm: gpio_uaf_repro Tainted: G        W
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009)
Call Trace:
 <TASK>
 dump_stack_lvl+0x55/0x70
 print_report+0xcb/0x5e0
 kasan_report+0xb8/0xf0
 _raw_spin_unlock_irqrestore+0x16/0x40
 free_irq+0x16a/0x490
 edge_detector_stop+0x90/0xc0
 linereq_free+0x8c/0xf0
 linereq_release+0x1f/0x30
 __fput+0x1c5/0x490
 fput_close_sync+0xc9/0x160
 __x64_sys_close+0x55/0x90
 do_syscall_64+0x5a/0x4d0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
 </TASK>

Allocated by task 135:
 kasan_save_stack+0x24/0x50
 kasan_save_track+0x14/0x30
 __kasan_kmalloc+0x7f/0x90
 __irq_alloc_descs+0x1f7/0x460
 irq_domain_alloc_descs.part.0+0x4b/0x90
 irq_create_mapping_affinity_locked+0x67/0x160
 irq_create_mapping_affinity+0x10f/0x180
 gpiochip_to_irq+0x180/0x1a0
 gpiod_to_irq+0xa7/0x140
 edge_detector_setup+0x2d4/0x4f0
 linereq_create+0x711/0x830
 gpio_ioctl+0x115/0x830
 __x64_sys_ioctl+0x56a/0xbf0
 do_syscall_64+0x5a/0x4d0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Freed by task 31:
 kasan_save_stack+0x24/0x50
 kasan_save_track+0x14/0x30
 kasan_save_free_info+0x3b/0x60
 __kasan_slab_free+0x43/0x70
 kfree+0x177/0x450
 kobject_put+0xe1/0x2c0
 rcu_core+0x3de/0xeb0
 handle_softirqs+0xf9/0x3c0
 run_ksoftirqd+0x27/0x30
 smpboot_thread_fn+0x19c/0x370
 kthread+0x1cb/0x220
 ret_from_fork+0x2d6/0x3f0
 ret_from_fork_asm+0x1a/0x30

Last potentially related work creation:
 kasan_save_stack+0x24/0x50
 kasan_record_aux_stack+0x8c/0xa0
 __call_rcu_common.constprop.0+0x4f/0x550
 free_desc+0xef/0x150
 irq_free_descs+0x47/0x70
 gpiochip_irqchip_remove+0x1ca/0x400
 gpiochip_remove+0x23b/0x2d0
 virtio_gpio_remove+0x2a/0x60
 virtio_dev_remove+0x68/0x100
 device_release_driver_internal+0x24f/0x2f0
 unbind_store+0xb1/0xc0
 kernfs_fop_write_iter+0x1c9/0x270
 vfs_write+0x5f1/0x760
 ksys_write+0xc3/0x160
 do_syscall_64+0x5a/0x4d0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

The buggy address belongs to the object at ffff88800bc9a800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 276 bytes inside of
 freed 1024-byte region [ffff88800bc9a800, ffff88800bc9ac00)
==================================================================

So the irq_desc is freed from gpiochip_irqchip_remove() ->
irq_free_descs(), then close() still calls free_irq() because cdev
cached the irq number in the line request.

virtio-gpio is only how I triggered it. The close path is generic
gpiolib-cdev.

ec8b6f55b981 already drops leftover irq actions on chip removal, so the
original procfs leak is gone. It does not clear the irq stored in the cdev line
request, which is how this UAF still happens.

Related earlier discussion:

  https://lore.kernel.org/r/20240919135104.3583-1-brgl@bgdev.pl
  https://patchew.org/linux/20240227113426.253232-1-herve.codina@bootlin.com/

I tried to write a patch, but a complete fix seems to touch more than I
am comfortable changing as a minimal fix: notify vs close, line
reconfigure, and the remaining-irq teardown all need to stay in sync.
My reading of gpiolib is also pretty limited, so I am just reporting
the bug for now.

Thanks,
Jia

