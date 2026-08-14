Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEDF43CEC1
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786702222; cv=pass; b=TD0gAeVDh7yNIUs2+Jnheo1lkG0iHzxRLzjTRr4QGjl27HRr626oR5uh41QBvijnoVwF6GGCZoJswxPWQxVDQALXb2Sf926SPuuY7ZGn5lI7DRF0t1nBynNiA6ROupB5DiFaseIX9KGXaYd9lcMUU9Hp/mumxLDDcxai72UQeCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786702222; c=relaxed/simple;
	bh=CnEntg3APpSnZJoHX3eaoFpuVoG/VhADa4LUWMudkkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LyJj7yhyWwQ8JiAqcuki0lt2M/JHObUWinHwKJfCWgSj2ccmESDMob/AuZXhCzvFbBvnxdx1p933IH4swB5IdgVUmh4n3dvKYcdwo1MJYn+7oCOuQxHtHhmIwY1e2iqmqCmXm6LNhrWzZxibASq8xZGLI+6/WfuQ3/LMpq53BmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/XK2DRj; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/XK2DRj"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66c711b7f2aso1216796d50.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 03:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786702208; cv=none;
        d=google.com; s=arc-20260327;
        b=IeDZUhfVbRD5eGO0OeV2l+B1eH1UTymBuMKM8xy+vwZqw2181TUMxwvtz9R0PcUt2x
         GI+onVEas+XmCQ1PQgliBbvcw9KUE7bGRXu+oV4kRc2ohDzuhfiYzawrNKOfeuG0/wEm
         6hdVcNGOnFp+MkYCjoTF1MhwYKcDbhnzASIh6xAYq6ZdvqKJuGecxLp/oIqJ4+slw8tA
         FRGa5PbtPtRrPhItlo+1kx5HI8u10so1sMEZNM2byUtZFfJD9BrhtIXTQRNAQ1b2x0Uz
         HJgHv6IpoPbW3yjfQYAyT0u05Cs9XoTuU6M5V/HvL225gbZ42gzj0qR23Z8mb/cgqZgM
         Si+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qz+thOeJlPGkaC9mf5o+RIsqCiDGs9bjmf0Nw6NkTXs=;
        fh=S5FmUUV1tZp59wKaRI1Uw0Z1phqrHeiPAndU0pTDPTM=;
        b=esO4qncVZILku8+gKqeIBGmoCUxqhv8/zxrLN9JVKTdXecCdxPJQWPYzfif19xyqX3
         ynXa0y3ZDO5OzvYVS13PchjhethHwmVbinU10Y/v1/IojhytogDjki6HFG9PfyqLF+1G
         twcrprqxZSltJfa3U21T6/KZ0y4NJaSCIj0V002QQ6Vk2d4QLTtoPEgZoyuTMqehwfpL
         rLQrVNS3XvWzjWHu2xaz3SNUkGpAF32rqUdIYzGbAkql09vXAJXq/0atjPefovl4MhNi
         upjWjQy3KxRJRPT7aZAT+NsA14mACz2Xdd8ztpakHYBU7A9DVXqE2B+stxW0IU/qWe9F
         cPBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786702208; x=1787307008; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qz+thOeJlPGkaC9mf5o+RIsqCiDGs9bjmf0Nw6NkTXs=;
        b=X/XK2DRjLf5bOZA0oFShO31gEpk4YrZSQYMU3S/tM8o/J3lIRmEa1r0i3dO1RQ+Jma
         4uRIiZhR0wIWeTqVKSehweSs4UXm4qXwH51zxMXaEC6+oVOB9B2R4sdqpXsska/HNaud
         AIi39WZ0PO1GKM2tKRrTACucbrYZBE1cig281FQzYWR664cAfx5zyh0DMoHn7c3GSUGa
         UQZkAQZybViAPIoXRLcsSOFvTqXtuwkPti52DW3LsmKW8cSb7X5gHyPOphsIl5lEGfbS
         W/beLC/2uWJyuTl1Zj/TlhlJlubozurvqnumZXbdWgKHMdtyTwUMYxujWc85nirCXqGa
         JgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786702208; x=1787307008;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qz+thOeJlPGkaC9mf5o+RIsqCiDGs9bjmf0Nw6NkTXs=;
        b=WOGvSBfCRu5fJ+S3E2sul1rNUJV/uP+VlfrE4GE/8yX0lXed8QXMFyh1TPn9xRg2iZ
         4e8LCNRQmIUAAjxWrwEIL3r1R7SM2vteEE02P6YAT1Jp4ArKLEcl2vecwNnP/9pmzDDA
         p/nsmo9PUajEtPukM2E6Wong+P19Ww7pj4KYyvaNi4dwAocHFWrCfY5Frb8vft0/UtzX
         SHop2MwdVltu5y4MHDwxSJCUvwsltrKB07BHA3u7K11MLXQ1Ahsn1SCvJNmrWVbfR6CH
         egcFiVDHYLRNNSOXf6hAJPm/hBDaETGlT8HdknjoAZvK1OF4WKWgv0kedPFnP6+qSpCb
         INDg==
X-Forwarded-Encrypted: i=1; AHgh+RrCx9CCLbhOvOKWQ4AVoo29ALlxAY8qwxa4MXwUup+FPkOQtVJiYstRkduDOzZmcjFM8TelW/WSfAuX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlzeu9Raf+ecbXM6LnSsTBkoifKD8K3d0Go9KllXxSkZzqcjjr
	3y26Eq/z8Zho0s85RDhuH7H6pNyyoyzZajrWa9Y9TZfOMnVU8jWHRkfYFhZ36GJv3f5tvXN0oLy
	rEzxKMBnVNe4bLoMexMA8kkz4Dsd3Keo=
X-Gm-Gg: AR+sD12EM3LkDhnJguE2RkFH8JPOB6zfqLx+SnAIV0UqKsFYWlRMOMAFB3YqZbLcN3v
	huFead0jAxkBQ48bTE/A98xBixtfNqEoeNp/5Wiw7AShQV3WyDLnVHKtWOeWuotsjIZ97/uuyz/
	flsDiH+rYh6EFz7F+q6P29I3rKiO2y2UIYf57KG7lsd9X+jGL8B+3ppT0IrPe9BsDIlgF9QRCM8
	4gUdlqDWHjZxbzePbHCKsitI6Xsnx0kg6YCmx9J3MeHof/M6dISDPnmBtGN/Jx2NiKCQVeH+0lh
	SvZrbjQ4mfnwJWgpDrAu2mDGA6SMJtIlnob0em19NNENQt22TqlQoHStYADtEZsK652mj1Foey/
	b6x+qP53KkkGtKvtilQ0UCP1sbfIy1FOkKk807Gh4qxj/YLlO4ntEFN9natU8wKzjQcSkxW/ZXf
	Hcls0sKTNrnW5FOLSK0cs=
X-Received: by 2002:a05:690e:1c08:b0:664:dbd0:23b7 with SMTP id
 956f58d0204a3-66c72b1cdedmr2044946d50.9.1786702207211; Fri, 14 Aug 2026
 03:10:07 -0700 (PDT)
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
 <a23375c9-d188-4737-bfa0-f10e66ae7f08@leemhuis.info> <CANTFpSWhqkw4735EFyQ4XoSEiqsgCKt4jTxH4SDO-m3=ybwccw@mail.gmail.com>
 <444caa3c-01ae-4516-b63a-576e095fef94@amd.com> <9095d7c8-92fe-4163-98f8-a53bbcefd6cb@leemhuis.info>
In-Reply-To: <9095d7c8-92fe-4163-98f8-a53bbcefd6cb@leemhuis.info>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Fri, 14 Aug 2026 15:39:54 +0530
X-Gm-Features: AUfX_mwbfRSNa4lWLXnC25S8FaLsntbSf5LdUqlSY4qB1m7kHUibTSxcnSnXBTk
Message-ID: <CANTFpSV9jguMzmfN7STb7XANYdn8i34bVmpT=0NdJ_o=3_Y1CQ@mail.gmail.com>
Subject: Re: i2c designware change broke touchpad of a thinkpad
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	brgl@bgdev.pl, basavaraj.natikar@amd.com, linusw@kernel.org, 
	nathan@kernel.org, chaitanya.kumar.borah@intel.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Aug 2026, Thorsten Leemhuis wrote:
> Hardik, could you submit a revert to the lists? And then I'll provide my
> Tested-by and ask Linus to directly pick this up?

Sent: https://lore.kernel.org/all/20260814100719.9548-1-hardikprakash.official@gmail.com/

Verified on my end that it builds clean, boots clean, and correctly
restores the original Yoga 7 race (expected tradeoff) without
introducing anything else.

Thanks,
Hardik

On Thu, 13 Aug 2026 at 16:26, Thorsten Leemhuis <linux@leemhuis.info> wrote:
>
> On 8/12/26 14:34, Mario Limonciello wrote:
> > On 8/12/26 00:45, Hardik Prakash wrote:
> >> On Wed, 12 Aug 2026, Thorsten Leemhuis wrote:
> >>> While we wait for Mario a quick question: Should we revert
> >>> the culprit for 7.2 and reapply it later once we sorted this out? Of
> >>> course I'll continue to help debugging this.
> >>>
> >>> If it was just me I'd say "don't bother", but these kind of Thinkpads
> >>> are what some Linux users frequently buy, so I fear that other people
> >>> will run into this if the culprit makes it into 7.2.
> >>
> >> I agreed, I'd rather have this reverted than ship a known regression.
> >>
> >> Andi, WSA -- given 7.2 is close, could this go out as a revert now? I'll
> >> keep working the AMD bus-timing angle with Thorsten and Mario, and
> >> we can resubmit a corrected fix for a later release once it's actually
> >> understood.
> >
> > Let's please revert for 7.2 final and keep working at this.
>
> Can't see any messages from Andi on lore in the past week and just one
> from WSA. Guess well deserved holiday season or something like that.
> Happens, no worries, but I guess we thus should try to handle this on
> our own.
>
> Hardik, could you submit a revert to the lists? And then I'll provide my
> Tested-by and ask Linus to directly pick this up? In a case like this I
> guess that is one of the viable options. Or does anyone see a better
> path forward here?
>
> Ciao, Thorsten
> > I've got a /hunch/ what's going on.
> >
> > For both Dell and Lenovo I know a lot of designs have these I2C buses
> > that have both the EC and the APU connected to them.  "Both" the EC and
> > APU "can" operate as master.
> >
> > The reason that this exists is so that when the system is in pre-boot
> > the EC acts as master.  This lets you use the touchpad in the BIOS menus
> > for example.  When the OS boots up there is some ASL called which sends
> > an EC command that tells the EC to stand down.  At this point the APU
> > takes over and acts as master.
> >
> > So my theory here is that by changing this ordering the _DSM is not
> > called at the right timing anymore.
> >
> > This is a fairly similar issue as was seen that led to this commit:
> >
> > https://git.kernel.org/torvalds/c/7d62beb102d6f
> >>
> >> Thanks,
> >> Hardik
> >>
> >> On Wed, 12 Aug 2026 at 10:51, Thorsten Leemhuis
> >> <regressions@leemhuis.info> wrote:
> >>>
> >>> On 8/12/26 06:59, Hardik Prakash wrote:
> >>>> On Mon, 10 Aug 2026, Thorsten Leemhuis wrote:
> >>>>> Did a fresh boot and uploaded the dmesg again as well just in case:
> >>>>> https://www.leemhuis.info/files/misc/dmesg_patch_dyndbg2
> >>>>> https://www.leemhuis.info/files/misc/lsmod
> >>>>> https://www.leemhuis.info/files/misc/interrupts
> >>>>
> >>>> Thanks. Second boot reproduces the identical pattern: device_is_bound()
> >>>> =true at 1.132s, lost arbitration at 2.139s -- same ~1s gap as the
> >>>> first
> >>>> capture, so this is consistent and reproducible, not a one-off.
> >>>>
> >>>> interrupts rules out simple IRQ-line sharing: AMDI0010:01 has its own
> >>>> dedicated line (IRQ 11), separate from AMDI0010:00 (IRQ 10) and every
> >>>> amd_gpio ACPI:Event line. psp-1 exists (IR-PCI-MSIX-0000:c3:00.2) but
> >>>> shows zero recorded activity on any CPU.
> >>>>
> >>>> Since lost arbitration means an actual SDA/SCL-level collision (not an
> >>>> IRQ conflict), and there's no shared IRQ or visible PSP activity, if
> >>>> something else is touching this bus it's happening below what Linux's
> >>>> interrupt accounting can see -- which is why I wanted your take, Mario.
> >>>> Does this match a known pattern of firmware (PSP/EC) briefly taking
> >>>> this bus during boot on AMD platforms?
> >>>
> >>> Thx again. While we wait for Mario a quick question: Should we revert
> >>> the culprit for 7.2 and reapply it later once we sorted this out? Of
> >>> course I'll continue to help debugging this.
> >>>
> >>> If it was just me I'd say "don't bother", but these kind of Thinkpads
> >>> are what some Linux users frequently buy, so I fear that other people
> >>> will run into this if the culprit makes it into 7.2.
> >>>
> >>> Ciao, Thorsten
> >>>
> >>>> On Mon, 10 Aug 2026 at 12:18, Thorsten Leemhuis
> >>>> <linux@leemhuis.info> wrote:
> >>>>>
> >>>>> On 8/10/26 07:54, Hardik Prakash wrote:
> >>>>>> On Sun, 9 Aug 2026, Thorsten Leemhuis wrote:
> >>>>>>> Sorry, picked the wrong file while preparing the mail, it's here:
> >>>>>>> https://www.leemhuis.info/files/misc/dmesg_patch_dyndbg
> >>>>>>
> >>>>>> Thanks, that's the one. Full timeline from that boot:
> >>>>>>
> >>>>>>    0.619s  AMDI0010:00 and AMDI0010:01 defer (AMDI0030:00 not
> >>>>>> registered)
> >>>>>>    1.136s  Retry succeeds: device_is_bound()=true for AMDI0030:00,
> >>>>>>            confirmed for all three children (XXXX0000:00,
> >>>>>> SYNA8018:00,
> >>>>>>            NXP1001:00)
> >>>>>>    2.222s  lost arbitration on AMDI0010:01 (x3)
> >>>>>>    3.260s  controller timed out, HID descriptor fetch fails
> >>>>>>
> >>>>>> The dependency check itself is behaving correctly here -- it defers,
> >>>>>> then correctly confirms AMDI0030:00 is bound before letting probe
> >>>>>> continue. The arbitration failure happens over a second *after* that,
> >>>>>> when the touchpad attempts its actual first transaction.
> >>>>>>
> >>>>>> So this doesn't look like a logic bug in the check itself. My
> >>>>>> read: by
> >>>>>> delaying dw_i2c_plat_probe() by ~500ms (correctly, for GPIO's sake),
> >>>>>> something else ends up contending for the AMDI0010:01 bus by the time
> >>>>>> the touchpad's first transaction actually happens -- a window that
> >>>>>> the original (undeferred, earlier) probe attempt apparently avoided.
> >>>>>>
> >>>>>> Mario -- does this look like a known AMD I2C/PSP semaphore contention
> >>>>>> pattern to you? Wondering if there's a shared bus/firmware consumer
> >>>>>> that could explain a ~1s-later collision like this, independent of
> >>>>>> the GPIO controller itself being ready.
> >>>>>>
> >>>>>> Thorsten, if you have it handy: /proc/interrupts and lsmod from this
> >>>>>> boot would help narrow down what else might be touching that bus
> >>>>>> around the 2.2s mark.
> >>>>>
> >>>>> Did a fresh boot and uploaded the dmesg again as well just in case:
> >>>>>
> >>>>> https://www.leemhuis.info/files/misc/dmesg_patch_dyndbg2
> >>>>> https://www.leemhuis.info/files/misc/lsmod
> >>>>> https://www.leemhuis.info/files/misc/interrupts
> >>>>>
> >>>>> Ciao, Thorsten
> >>>>>> On Mon, 10 Aug 2026 at 11:06, Thorsten Leemhuis
> >>>>>> <linux@leemhuis.info> wrote:
> >>>>>>>
> >>>>>>> On 8/10/26 07:23, Hardik Prakash wrote:
> >>>>>>>> On Sat, 8 Aug 2026, Thorsten Leemhuis wrote:
> >>>>>>>>> https://www.leemhuis.info/files/misc/dmesg-master-plus_revert
> >>>>>>>>>
> >>>>>>>>> [    0.619018] i2c-dw-gpio-dbg:
> >>>>>>>>> i2c_dw_check_gpio_dependencies(AMDI0010:00)
> >>>>>>>>> [...]
> >>>>>>>>> [    1.136010] i2c-dw-gpio-dbg: device_is_bound()=true for
> >>>>>>>>> AMDI0030:00
> >>>>>>>>
> >>>>>>>> Thanks, this trace looks correct on its face (defer at 0.619s,
> >>>>>>>> retry
> >>>>>>>> succeeds at 1.122-1.136s), but the link above points to the same
> >>>>>>>> file
> >>>>>>>> you sent last round (the master+revert baseline, no debug patch, no
> >>>>>>>> i2c-dw-gpio-dbg lines in it at all) rather than this new capture.
> >>>>>>>>> Could you share the full, unfiltered dmesg from this exact boot
> >>>>>>>>> (the
> >>>>>>>> one with the debug patch applied)? I need to see where
> >>>>>>>> "lost arbitration" falls relative to the trace above.
> >>>>>>>
> >>>>>>> Sorry, picked the wrong file while preparing the mail, it's here:
> >>>>>>> https://www.leemhuis.info/files/misc/dmesg_patch_dyndbg
> >>>>>>>
> >>>>>>> Ciao, Thorsten
> >>>>>>>
> >>>>>>>> Separately, from your DSDT: NFC1 (NXP1001), which shows up as a
> >>>>>>>> child
> >>>>>>>> of AMDI0010:01 in your trace, declares its _CRS as a raw resource
> >>>>>>>> buffer containing three GPIO resources referencing \_SB.GPIO -- one
> >>>>>>>> GpioIo and two separate GpioInt entries. Not sure yet if that's
> >>>>>>>> relevant, but it's a pattern I haven't seen on my hardware
> >>>>>>>> which I've tested against.
> >>>>>>>>
> >>>>>>>> Thanks,
> >>>>>>>> Hardik
> >>>>>>>>
> >>>>>>>> On Sun, 9 Aug 2026 at 21:49, Thorsten Leemhuis
> >>>>>>>> <linux@leemhuis.info> wrote:
> >>>>>>>>>
> >>>>>>>>> On 8/8/26 22:25, Andy Shevchenko wrote:
> >>>>>>>>>> On Sat, Aug 08, 2026 at 10:31:28PM +0530, Hardik Prakash wrote:
> >>>>>>>>>>> On Fri, 7 Aug 2026, Thorsten Leemhuis wrote:
> >>>>>>>>>>>> This became 0a4bb2abc3e56d ("i2c: designware: defer probe if
> >>>>>>>>>>>> child
> >>>>>>>>>>>> GpioInt controllers are not bound") and causes a regression
> >>>>>>>>>>>> for me: the
> >>>>>>>>>>>> Touchpad in my ThinkPad T14s Gen 4 (AMD) stopped working.
> >>>>>>>>>>>> From the
> >>>>>>>>>>>> kernel log:
> >>>>>>>>>>>>
> >>>>>>>>>>>> i2c_designware AMDI0010:01: i2c_dw_handle_tx_abort: lost
> >>>>>>>>>>>> arbitration
> >>>>>>>>>>>> i2c_designware AMDI0010:01: controller timed out
> >>>>>>>>>>>> i2c_hid_acpi i2c-SYNA8018:00: failed to fetch HID
> >>>>>>>>>>>> descriptor: -110
> >>>>>>>>>>>> i2c_hid_acpi i2c-SYNA8018:00: Failed to fetch the HID
> >>>>>>>>>>>> Descriptor
> >>>>>>>>>>>>
> >>>>>>>>>>>> Reverting this change in current mainline/master
> >>>>>>>>>>>> (f9a2394a23482) fixed
> >>>>>>>>>>>> things for me. Full dmesg of current master and
> >>>>>>>>>>>> master+revert can be
> >>>>>>>>>>>> found here:
> >>>>>>>>>>>>
> >>>>>>>>>>>> https://www.leemhuis.info/files/misc/dmesg-master
> >>>>>>>>>>>> https://www.leemhuis.info/files/misc/dmesg-master-plus_revert
> >>>>>>>>>>> [...]
> >>>>>>>>>>> Two things that would help narrow this down, whenever you
> >>>>>>>>>>> have a moment:
> >>>>>>>>>
> >>>>>>>>> Thx for looking into this. Here we go:
> >>>>>>>>>
> >>>>>>>>>>> 1. A DSDT dump
> >>>>>>>>>
> >>>>>>>>> https://www.leemhuis.info/files/misc/dsdt.dsl
> >>>>>>>>>
> >>>>>>>>>>> 2. A dmesg with dynamic debug from a kernel built with the
> >>>>>>>>>>> attached
> >>>>>>>>>>>     patch on top of current mainline/master
> >>>>>>>>>
> >>>>>>>>> https://www.leemhuis.info/files/misc/dmesg-master-plus_revert
> >>>>>>>>>
> >>>>>>>>> [    0.619018] i2c-dw-gpio-dbg:
> >>>>>>>>> i2c_dw_check_gpio_dependencies(AMDI0010:00)
> >>>>>>>>> [    0.619018] i2c-dw-gpio-dbg:
> >>>>>>>>> check_child_gpioint(adev=XXXX0000:00)
> >>>>>>>>> [    0.619076] i2c-dw-gpio-dbg: GpioInt
> >>>>>>>>> resource_source=\_SB.GPIO (len=10)
> >>>>>>>>> [    0.619079] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>>>>> device=AMDI0030:00
> >>>>>>>>> [    0.619080] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode()
> >>>>>>>>> returned
> >>>>>>>>> NULL, deferring
> >>>>>>>>> [    0.619082] i2c-dw-gpio-dbg: check_child_gpioint ret=-517
> >>>>>>>>> (defer)
> >>>>>>>>> [    0.619102] i2c-dw-gpio-dbg:
> >>>>>>>>> i2c_dw_check_gpio_dependencies(AMDI0010:01)
> >>>>>>>>> [    0.619104] i2c-dw-gpio-dbg:
> >>>>>>>>> check_child_gpioint(adev=SYNA8018:00)
> >>>>>>>>> [    0.619159] i2c-dw-gpio-dbg: GpioInt
> >>>>>>>>> resource_source=\_SB.GPIO (len=10)
> >>>>>>>>> [    0.619162] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>>>>> device=AMDI0030:00
> >>>>>>>>> [    0.619162] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode()
> >>>>>>>>> returned
> >>>>>>>>> NULL, deferring
> >>>>>>>>> [    0.619164] i2c-dw-gpio-dbg: check_child_gpioint ret=-517
> >>>>>>>>> (defer)
> >>>>>>>>> [    1.122517] i2c-dw-gpio-dbg:
> >>>>>>>>> i2c_dw_check_gpio_dependencies(AMDI0010:00)
> >>>>>>>>> [    1.122523] i2c-dw-gpio-dbg:
> >>>>>>>>> check_child_gpioint(adev=XXXX0000:00)
> >>>>>>>>> [    1.122625] i2c-dw-gpio-dbg: GpioInt
> >>>>>>>>> resource_source=\_SB.GPIO (len=10)
> >>>>>>>>> [    1.122636] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>>>>> device=AMDI0030:00
> >>>>>>>>> [    1.122639] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode()
> >>>>>>>>> succeeded
> >>>>>>>>> [    1.122642] i2c-dw-gpio-dbg: device_is_bound()=true for
> >>>>>>>>> AMDI0030:00
> >>>>>>>>> [    1.135894] i2c-dw-gpio-dbg:
> >>>>>>>>> i2c_dw_check_gpio_dependencies(AMDI0010:01)
> >>>>>>>>> [    1.135898] i2c-dw-gpio-dbg:
> >>>>>>>>> check_child_gpioint(adev=SYNA8018:00)
> >>>>>>>>> [    1.135976] i2c-dw-gpio-dbg: GpioInt
> >>>>>>>>> resource_source=\_SB.GPIO (len=10)
> >>>>>>>>> [    1.135980] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>>>>> device=AMDI0030:00
> >>>>>>>>> [    1.135983] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode()
> >>>>>>>>> succeeded
> >>>>>>>>> [    1.135985] i2c-dw-gpio-dbg: device_is_bound()=true for
> >>>>>>>>> AMDI0030:00
> >>>>>>>>> [    1.135987] i2c-dw-gpio-dbg:
> >>>>>>>>> check_child_gpioint(adev=NXP1001:00)
> >>>>>>>>> [    1.136005] i2c-dw-gpio-dbg: GpioInt
> >>>>>>>>> resource_source=\_SB.GPIO (len=10)
> >>>>>>>>> [    1.136008] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>>>>> device=AMDI0030:00
> >>>>>>>>> [    1.136009] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode()
> >>>>>>>>> succeeded
> >>>>>>>>> [    1.136010] i2c-dw-gpio-dbg: device_is_bound()=true for
> >>>>>>>>> AMDI0030:00
> >>>>>>>>>
> >>>>>>>>> HTH, Ciao, Thorsten
> >>>>>>>>>
> >>>>>>>>>>> On Fri, 7 Aug 2026 at 19:37, Thorsten Leemhuis
> >>>>>>>>>>> <linux@leemhuis.info> wrote:
> >>>>>>>>>>>> On 7/28/26 10:30, Andi Shyti wrote:
> >>>>>>>>>>>>> On Sat, Jul 18, 2026 at 11:13:31AM +0530, Hardik Prakash
> >>>>>>>>>>>>> wrote:
> >>>>>>>>>>>>>> I2C controllers may have child devices with GpioInt
> >>>>>>>>>>>>>> resources that
> >>>>>>>>>>>>>> depend on GPIO controllers being fully initialized. If the
> >>>>>>>>>>>>>> I2C
> >>>>>>>>>>>>>> controller probes and enumerates children before the
> >>>>>>>>>>>>>> referenced GPIO
> >>>>>>>>>>>>>> controller has completed probe, GPIO interrupts may not be
> >>>>>>>>>>>>>> properly
> >>>>>>>>>>>>>> configured, leading to device failures.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> >>>>>>>>>>>>>> AMDI0010:02) has a GpioInt resource pointing to GPIO 157
> >>>>>>>>>>>>>> on the
> >>>>>>>>>>>>>> pinctrl-amd controller (AMDI0030:00). When i2c-designware
> >>>>>>>>>>>>>> probes
> >>>>>>>>>>>>>> AMDI0010:02 before pinctrl-amd finishes initializing, I2C
> >>>>>>>>>>>>>> transactions
> >>>>>>>>>>>>>> fail with lost arbitration errors:
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>>    0.285952  amd_gpio_probe: registering gpiochip  <- GPIO
> >>>>>>>>>>>>>> chip visible
> >>>>>>>>>>>>>>    0.287121  amd_gpio_probe: requesting parent IRQ <-
> >>>>>>>>>>>>>> probe still running
> >>>>>>>>>>>>>>    0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <-
> >>>>>>>>>>>>>> races here
> >>>>>>>>>>>>>>    2.348157  lost arbitration
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Add a dependency check that walks ACPI child devices and
> >>>>>>>>>>>>>> defers probe
> >>>>>>>>>>>>>> until any referenced GPIO controller is bound.
> >>>>>>>>>>
> >>>>>>>>>> [...]
> >>>>>>>>>>
> >>>>>>>>>>>> #regzbot introduced: 0a4bb2abc3e56d
> >>>>>>>>>>>> #regzbot title i2c: designware: ThinkPad touchpad broke
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>
> >>>>
> >>>
> >
>
