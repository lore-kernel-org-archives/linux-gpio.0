Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1495530F803
	for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2026 05:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786513567; cv=pass; b=qu8OgPDnODgFkdug3VgF+uI7mxO5Ubn/08iLuROKMH1PgGw6IVZGSLK4OHjErfv0JtYAFax6T+TONDO62yC6WVwVzbCsCHmkRqRClkipec09+C5riz3FHkj+PjUnZcPTe6VHNF/tvvm6YgGyf6F8E7AIzGng4Rt+ctEZnnQal2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786513567; c=relaxed/simple;
	bh=bFAEj3oT5Ot0NB01sLAK5dFKYoPrSPcsaKh02uyDIVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVjY5+SYZbwTYxWdqg3sOdXadB1NERzrZ2akfsPgR0B2xJKipVm0sXZ2SFkXvFQ3XtePg1Od9wDcmhgbiDLNFYbo+ufDdv25rT8V9DHp3Pscsod57gCOKR3RPOArOr/C6v0lPWPgnOGQsnww/YLCFBMvEwcNO7uXRnUqdRVOdbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbMckDzC; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbMckDzC"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6611669cd16so896362d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 22:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786513565; cv=none;
        d=google.com; s=arc-20260327;
        b=bt6V5VTwOLLXaYn2Fj6hDOzy3F5M5OsX5PmC/1iOxAG8s/qfb5whGzCtGCanXQ7dDl
         SsJyuieoocdP5bt6TcnPOZaThGQlH3aG+4tJoYS6TzYWfJVjFh0VrpBdlb0qAROxn1ot
         7aPIi49kxihX6hEwzNogQAdQJ/QvOKppsd5h6dDqE5FlOPEiMXKbXOb+Rh5PmLlKJKvW
         gth5iMaGaaq1SVP2CWQIxhmMzzG8JNNNuIgzKOksNK++9mJ/6NiOfYuTZybwYmby7Ret
         G/3f2Pf9oOqi8GTQq5Xa5Xr9CW+Oaz+NcmWN2pp6rCGKxKnk/mOgH7FOF8HOJZTGIpsg
         FTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nbAf1OH6bskQS8gheHwIfaPlihycwpspEeaErmRr+CI=;
        fh=SU3EWqcHCHWhKCECE8j5bYr6kWC92Cx6jnkUFPS17jw=;
        b=rXWHnAiWBnLPZkDADZBSmd94883H1bf9PBn1KYxgrKLnLOj/g8vxCKnAf373nlkDBy
         io29qCmml1oKfhNO9CHkp4JmqPCnazbIcOFoxu+8PZmojF0JQoMaTCJGbc1O2rlT9bG6
         uGY9ew8rwoRJTnSWJTVZGkzXcLhq5tdNTWfhglIxX2jBxtYvdMwwFR1n0DR+63JhF6GN
         Kt3ou6GyIFbD2N4l0YFibDX9aZKEHK3tvEn6Vr9xcoVTEoHGpe3e8eiWngiz4jiIORXg
         KpMvEDyR2+/+U6jFmudNnadaNBXboOqhJyfxIdZahE8V4blfEk4DhDNOcaGQE6OPyPZ1
         COOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786513565; x=1787118365; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbAf1OH6bskQS8gheHwIfaPlihycwpspEeaErmRr+CI=;
        b=CbMckDzCrZKGF45n/Tgh7QwDkYJZSkAhDiVj6Q7Tf9Hswo4gk6tb7VZvBScdztMTAZ
         tgLJNDo/fUUYAVjHPdBY3YeZ3v0gKDWb+QXRxkcfc5NPulu53f7R/QLLnYIdcgHFnTED
         Je9D1dfXMnApK/YDdX4ur21/gbTyyf4tE9OGRNe6IUVUT4d0uJNFghaoyvvx1+iN2BLS
         PprOfgUOzV3+0ybaYkauscMe7NiUoqwipoqVTs31/a1B+98kTSnNd+YRBeeArUk8bQ8n
         s8xyrCbI1imP9Kd5D1ztGbLqVlELSrdbbk+3MyirRNOfSe66DI6g10akGnmnycserlbB
         O5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786513565; x=1787118365;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nbAf1OH6bskQS8gheHwIfaPlihycwpspEeaErmRr+CI=;
        b=At5WfAOgDdx6lJup5Pw9wTvuCik9nbe4klXXYfYEm6WhxjWO7khYOhVp0D8F0Vrc0D
         lT+BJqiLi6iIqSkGbwIxBw8yi8TF39ZzZ2SjV/8BxMnEG7k8OMFYhFIRxnFQcMewaqkZ
         AtLbB0HS9RYRkRlRqDHv2Q6vso6InaRn8fUYP3KvH5SV3f/3NLJ6Irxy2CfmAXuh38k/
         oKukr8uup60LcnTmNTx50w9OyxyyLgbNAUCxwkJ6OweAqWVTUHXi1zm0bgA5rWLc7fy5
         ZkpKWYMQDVQimolIjo9yNvO3ezC0wkGG6v6WBvy1FGlni3+W8tVitk5g/t/9t2ep5qRN
         ZSxw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1kx7iKCcvcjrhP+waEqNPtrQINgaQVujASm59+tqIgqnqNPlM1jYXkq3KOtNois2299LAmqW5IVAb@vger.kernel.org
X-Gm-Message-State: AOJu0YyFiDwY6/Z8850tX746+0XPa3/8G9L1hLF08MVohsD0Go5HdkAV
	VXvfd8IZKIN+0owRqQ32JT9JHAJgsMHld+/uNIVwSfr6tdwxccFI60t7OP/Mu1UCNGUaLnEkHNY
	wK1D+2DTwWj3DvXPOsZ+/NHalzYoRH5Y=
X-Gm-Gg: AR+sD12kcpZl1It3cGUNVm59lSsmd+aTkEpj4zpFl8uePgkl/sEsKrbgLJTcc6UXCkx
	eRpT93CyQfpCxzuWb1ZY9MMvDuoT43S8+dmLaCbpKg1ZBR8bnTfjYgFjfGuG+ciA8WAro35t1hj
	+L1QVkD6+MUjl2K/Aie0tx1wzRvPtNRGUYnSz12+AJRVbJXDhfunVtXiEdPQT+v4/HidflvIBe4
	S4NUNibBz6GCDjRRNHceEOfoeF1ds8dIikCl+cu7oNvBxNEsgu+yLgwl6QmaluUmUfZyVQbBCm/
	y+5fH2tHOdqZq8+9vO07S+dzXJ0TO9XCmpdsUEfujTm3RnFpIrTPFZU0GQJFPx+B66E9pZSPPxE
	eIVrjPggxWNQ4l13+35vpfW3FKFjn/dPiz/9QTc+hgyl3k77CYp05d/jJqdmLhxObpp8Cim/CXd
	vXP9S610sZdpgEjiHEgAdZWm99q/XMPos=
X-Received: by 2002:a53:e317:0:b0:66b:331c:b040 with SMTP id
 956f58d0204a3-66b34308774mr945065d50.31.1786513564817; Tue, 11 Aug 2026
 22:46:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718054330.8975-2-hardikprakash.official@gmail.com>
 <amhodWpAI3K6aeBH@zenone.zhora.eu> <b4a4eadb-282f-464c-843a-19d415a34d0c@leemhuis.info>
 <CANTFpSW+w1GZMbLXszuqZFCZjeVJfFG2bc1vJad+OMzsy-CPCg@mail.gmail.com>
 <aneQvMN_Zet2b62n@ashevche-desk.local> <b5b95476-636f-40b1-8575-47918169b7bb@leemhuis.info>
 <CANTFpSWzV9tzMwc2cURCQBhpZmrv1SsZqnwBEu0jt=ZQWfvWgQ@mail.gmail.com>
 <1a209e14-05c6-4796-a8fc-d0c3a776520d@leemhuis.info> <CANTFpSWnTjoTS8hBOvVM_w3pWHyOiBhch_GXe_mG-d56WeF-0w@mail.gmail.com>
 <5a5f7f58-b35b-407f-a5e5-293a88cafcc0@leemhuis.info> <CANTFpSWTkwmb3F9UnZmeaLizH-cC6evXD=kd1eNwJWkCfyj8DQ@mail.gmail.com>
 <a23375c9-d188-4737-bfa0-f10e66ae7f08@leemhuis.info>
In-Reply-To: <a23375c9-d188-4737-bfa0-f10e66ae7f08@leemhuis.info>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Wed, 12 Aug 2026 11:15:51 +0530
X-Gm-Features: AUfX_mxGcSh0iydmWZRih7TWDVib4qa26X7gdx5wLOHjLubMgF3h3r3F1m25t1M
Message-ID: <CANTFpSWhqkw4735EFyQ4XoSEiqsgCKt4jTxH4SDO-m3=ybwccw@mail.gmail.com>
Subject: Re: i2c designware change broke touchpad of a thinkpad
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linusw@kernel.org, nathan@kernel.org, chaitanya.kumar.borah@intel.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Aug 2026, Thorsten Leemhuis wrote:
> While we wait for Mario a quick question: Should we revert
> the culprit for 7.2 and reapply it later once we sorted this out? Of
> course I'll continue to help debugging this.
>
> If it was just me I'd say "don't bother", but these kind of Thinkpads
> are what some Linux users frequently buy, so I fear that other people
> will run into this if the culprit makes it into 7.2.

I agreed, I'd rather have this reverted than ship a known regression.

Andi, WSA -- given 7.2 is close, could this go out as a revert now? I'll
keep working the AMD bus-timing angle with Thorsten and Mario, and
we can resubmit a corrected fix for a later release once it's actually
understood.

Thanks,
Hardik

On Wed, 12 Aug 2026 at 10:51, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 8/12/26 06:59, Hardik Prakash wrote:
> > On Mon, 10 Aug 2026, Thorsten Leemhuis wrote:
> >> Did a fresh boot and uploaded the dmesg again as well just in case:
> >> https://www.leemhuis.info/files/misc/dmesg_patch_dyndbg2
> >> https://www.leemhuis.info/files/misc/lsmod
> >> https://www.leemhuis.info/files/misc/interrupts
> >
> > Thanks. Second boot reproduces the identical pattern: device_is_bound()
> > =true at 1.132s, lost arbitration at 2.139s -- same ~1s gap as the first
> > capture, so this is consistent and reproducible, not a one-off.
> >
> > interrupts rules out simple IRQ-line sharing: AMDI0010:01 has its own
> > dedicated line (IRQ 11), separate from AMDI0010:00 (IRQ 10) and every
> > amd_gpio ACPI:Event line. psp-1 exists (IR-PCI-MSIX-0000:c3:00.2) but
> > shows zero recorded activity on any CPU.
> >
> > Since lost arbitration means an actual SDA/SCL-level collision (not an
> > IRQ conflict), and there's no shared IRQ or visible PSP activity, if
> > something else is touching this bus it's happening below what Linux's
> > interrupt accounting can see -- which is why I wanted your take, Mario.
> > Does this match a known pattern of firmware (PSP/EC) briefly taking
> > this bus during boot on AMD platforms?
>
> Thx again. While we wait for Mario a quick question: Should we revert
> the culprit for 7.2 and reapply it later once we sorted this out? Of
> course I'll continue to help debugging this.
>
> If it was just me I'd say "don't bother", but these kind of Thinkpads
> are what some Linux users frequently buy, so I fear that other people
> will run into this if the culprit makes it into 7.2.
>
> Ciao, Thorsten
>
> > On Mon, 10 Aug 2026 at 12:18, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>
> >> On 8/10/26 07:54, Hardik Prakash wrote:
> >>> On Sun, 9 Aug 2026, Thorsten Leemhuis wrote:
> >>>> Sorry, picked the wrong file while preparing the mail, it's here:
> >>>> https://www.leemhuis.info/files/misc/dmesg_patch_dyndbg
> >>>
> >>> Thanks, that's the one. Full timeline from that boot:
> >>>
> >>>   0.619s  AMDI0010:00 and AMDI0010:01 defer (AMDI0030:00 not registered)
> >>>   1.136s  Retry succeeds: device_is_bound()=true for AMDI0030:00,
> >>>           confirmed for all three children (XXXX0000:00, SYNA8018:00,
> >>>           NXP1001:00)
> >>>   2.222s  lost arbitration on AMDI0010:01 (x3)
> >>>   3.260s  controller timed out, HID descriptor fetch fails
> >>>
> >>> The dependency check itself is behaving correctly here -- it defers,
> >>> then correctly confirms AMDI0030:00 is bound before letting probe
> >>> continue. The arbitration failure happens over a second *after* that,
> >>> when the touchpad attempts its actual first transaction.
> >>>
> >>> So this doesn't look like a logic bug in the check itself. My read: by
> >>> delaying dw_i2c_plat_probe() by ~500ms (correctly, for GPIO's sake),
> >>> something else ends up contending for the AMDI0010:01 bus by the time
> >>> the touchpad's first transaction actually happens -- a window that
> >>> the original (undeferred, earlier) probe attempt apparently avoided.
> >>>
> >>> Mario -- does this look like a known AMD I2C/PSP semaphore contention
> >>> pattern to you? Wondering if there's a shared bus/firmware consumer
> >>> that could explain a ~1s-later collision like this, independent of
> >>> the GPIO controller itself being ready.
> >>>
> >>> Thorsten, if you have it handy: /proc/interrupts and lsmod from this
> >>> boot would help narrow down what else might be touching that bus
> >>> around the 2.2s mark.
> >>
> >> Did a fresh boot and uploaded the dmesg again as well just in case:
> >>
> >> https://www.leemhuis.info/files/misc/dmesg_patch_dyndbg2
> >> https://www.leemhuis.info/files/misc/lsmod
> >> https://www.leemhuis.info/files/misc/interrupts
> >>
> >> Ciao, Thorsten
> >>> On Mon, 10 Aug 2026 at 11:06, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>>>
> >>>> On 8/10/26 07:23, Hardik Prakash wrote:
> >>>>> On Sat, 8 Aug 2026, Thorsten Leemhuis wrote:
> >>>>>> https://www.leemhuis.info/files/misc/dmesg-master-plus_revert
> >>>>>>
> >>>>>> [    0.619018] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:00)
> >>>>>> [...]
> >>>>>> [    1.136010] i2c-dw-gpio-dbg: device_is_bound()=true for AMDI0030:00
> >>>>>
> >>>>> Thanks, this trace looks correct on its face (defer at 0.619s, retry
> >>>>> succeeds at 1.122-1.136s), but the link above points to the same file
> >>>>> you sent last round (the master+revert baseline, no debug patch, no
> >>>>> i2c-dw-gpio-dbg lines in it at all) rather than this new capture.
> >>>>>> Could you share the full, unfiltered dmesg from this exact boot (the
> >>>>> one with the debug patch applied)? I need to see where
> >>>>> "lost arbitration" falls relative to the trace above.
> >>>>
> >>>> Sorry, picked the wrong file while preparing the mail, it's here:
> >>>> https://www.leemhuis.info/files/misc/dmesg_patch_dyndbg
> >>>>
> >>>> Ciao, Thorsten
> >>>>
> >>>>> Separately, from your DSDT: NFC1 (NXP1001), which shows up as a child
> >>>>> of AMDI0010:01 in your trace, declares its _CRS as a raw resource
> >>>>> buffer containing three GPIO resources referencing \_SB.GPIO -- one
> >>>>> GpioIo and two separate GpioInt entries. Not sure yet if that's
> >>>>> relevant, but it's a pattern I haven't seen on my hardware
> >>>>> which I've tested against.
> >>>>>
> >>>>> Thanks,
> >>>>> Hardik
> >>>>>
> >>>>> On Sun, 9 Aug 2026 at 21:49, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>>>>>
> >>>>>> On 8/8/26 22:25, Andy Shevchenko wrote:
> >>>>>>> On Sat, Aug 08, 2026 at 10:31:28PM +0530, Hardik Prakash wrote:
> >>>>>>>> On Fri, 7 Aug 2026, Thorsten Leemhuis wrote:
> >>>>>>>>> This became 0a4bb2abc3e56d ("i2c: designware: defer probe if child
> >>>>>>>>> GpioInt controllers are not bound") and causes a regression for me: the
> >>>>>>>>> Touchpad in my ThinkPad T14s Gen 4 (AMD) stopped working. From the
> >>>>>>>>> kernel log:
> >>>>>>>>>
> >>>>>>>>> i2c_designware AMDI0010:01: i2c_dw_handle_tx_abort: lost arbitration
> >>>>>>>>> i2c_designware AMDI0010:01: controller timed out
> >>>>>>>>> i2c_hid_acpi i2c-SYNA8018:00: failed to fetch HID descriptor: -110
> >>>>>>>>> i2c_hid_acpi i2c-SYNA8018:00: Failed to fetch the HID Descriptor
> >>>>>>>>>
> >>>>>>>>> Reverting this change in current mainline/master (f9a2394a23482) fixed
> >>>>>>>>> things for me. Full dmesg of current master and master+revert can be
> >>>>>>>>> found here:
> >>>>>>>>>
> >>>>>>>>> https://www.leemhuis.info/files/misc/dmesg-master
> >>>>>>>>> https://www.leemhuis.info/files/misc/dmesg-master-plus_revert
> >>>>>>>> [...]
> >>>>>>>> Two things that would help narrow this down, whenever you have a moment:
> >>>>>>
> >>>>>> Thx for looking into this. Here we go:
> >>>>>>
> >>>>>>>> 1. A DSDT dump
> >>>>>>
> >>>>>> https://www.leemhuis.info/files/misc/dsdt.dsl
> >>>>>>
> >>>>>>>> 2. A dmesg with dynamic debug from a kernel built with the attached
> >>>>>>>>    patch on top of current mainline/master
> >>>>>>
> >>>>>> https://www.leemhuis.info/files/misc/dmesg-master-plus_revert
> >>>>>>
> >>>>>> [    0.619018] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:00)
> >>>>>> [    0.619018] i2c-dw-gpio-dbg: check_child_gpioint(adev=XXXX0000:00)
> >>>>>> [    0.619076] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> >>>>>> [    0.619079] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>> device=AMDI0030:00
> >>>>>> [    0.619080] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() returned
> >>>>>> NULL, deferring
> >>>>>> [    0.619082] i2c-dw-gpio-dbg: check_child_gpioint ret=-517 (defer)
> >>>>>> [    0.619102] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:01)
> >>>>>> [    0.619104] i2c-dw-gpio-dbg: check_child_gpioint(adev=SYNA8018:00)
> >>>>>> [    0.619159] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> >>>>>> [    0.619162] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>> device=AMDI0030:00
> >>>>>> [    0.619162] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() returned
> >>>>>> NULL, deferring
> >>>>>> [    0.619164] i2c-dw-gpio-dbg: check_child_gpioint ret=-517 (defer)
> >>>>>> [    1.122517] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:00)
> >>>>>> [    1.122523] i2c-dw-gpio-dbg: check_child_gpioint(adev=XXXX0000:00)
> >>>>>> [    1.122625] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> >>>>>> [    1.122636] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>> device=AMDI0030:00
> >>>>>> [    1.122639] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() succeeded
> >>>>>> [    1.122642] i2c-dw-gpio-dbg: device_is_bound()=true for AMDI0030:00
> >>>>>> [    1.135894] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:01)
> >>>>>> [    1.135898] i2c-dw-gpio-dbg: check_child_gpioint(adev=SYNA8018:00)
> >>>>>> [    1.135976] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> >>>>>> [    1.135980] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>> device=AMDI0030:00
> >>>>>> [    1.135983] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() succeeded
> >>>>>> [    1.135985] i2c-dw-gpio-dbg: device_is_bound()=true for AMDI0030:00
> >>>>>> [    1.135987] i2c-dw-gpio-dbg: check_child_gpioint(adev=NXP1001:00)
> >>>>>> [    1.136005] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> >>>>>> [    1.136008] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>> device=AMDI0030:00
> >>>>>> [    1.136009] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() succeeded
> >>>>>> [    1.136010] i2c-dw-gpio-dbg: device_is_bound()=true for AMDI0030:00
> >>>>>>
> >>>>>> HTH, Ciao, Thorsten
> >>>>>>
> >>>>>>>> On Fri, 7 Aug 2026 at 19:37, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>>>>>>>> On 7/28/26 10:30, Andi Shyti wrote:
> >>>>>>>>>> On Sat, Jul 18, 2026 at 11:13:31AM +0530, Hardik Prakash wrote:
> >>>>>>>>>>> I2C controllers may have child devices with GpioInt resources that
> >>>>>>>>>>> depend on GPIO controllers being fully initialized. If the I2C
> >>>>>>>>>>> controller probes and enumerates children before the referenced GPIO
> >>>>>>>>>>> controller has completed probe, GPIO interrupts may not be properly
> >>>>>>>>>>> configured, leading to device failures.
> >>>>>>>>>>>
> >>>>>>>>>>> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> >>>>>>>>>>> AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> >>>>>>>>>>> pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> >>>>>>>>>>> AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> >>>>>>>>>>> fail with lost arbitration errors:
> >>>>>>>>>>>
> >>>>>>>>>>>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> >>>>>>>>>>>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> >>>>>>>>>>>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> >>>>>>>>>>>   2.348157  lost arbitration
> >>>>>>>>>>>
> >>>>>>>>>>> Add a dependency check that walks ACPI child devices and defers probe
> >>>>>>>>>>> until any referenced GPIO controller is bound.
> >>>>>>>
> >>>>>>> [...]
> >>>>>>>
> >>>>>>>>> #regzbot introduced: 0a4bb2abc3e56d
> >>>>>>>>> #regzbot title i2c: designware: ThinkPad touchpad broke
> >>>>>>>
> >>>>>>
> >>>>>
> >>>>
> >>>
> >>
> >
>
