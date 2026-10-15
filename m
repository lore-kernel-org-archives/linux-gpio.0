Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7939B480353
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 20:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095196; cv=pass; b=Xf3O2Z08SYUCqu6pFTPbIkBpvMmBr93cTcIjvIXBCfBN2RFGHErFYleXTYgK396V4tRVmhKtX9RGTiAUd4+zgTdtekPMNuuWT6X1VoNLl/oVrZfemCgrMMtWSqAHCtyuRxugq2XvzAghTvTyqQdr7ngz2mgyTasgxxwZTyGe3Xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095196; c=relaxed/simple;
	bh=VhazBpOhj0QlIU3lekCy/9/OQJm95CHgExxNIn9AYpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUuIZHiuilI/Kkk0x31LhinFPUWw9AVZ/+8MDrtH+mcwJUNWwMv+XbLha6F3wmItEM2KhmPrNPOGVPUtaPiY40HRMl1/uGfLCCJL3qCjpwlQjcZSwllDOp2Xtb7qsLVn5KUyTPHiH2qvubmn6r8k/wkTiWEiTxTUcisLSeQh+8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kz82OO8m; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kz82OO8m"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso946919866b.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 13:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792095193; cv=none;
        d=google.com; s=arc-20260327;
        b=Vj+t1/l4L+p7Y++7KRLSkIPwmHVg/zVaLMUQnrZSXXKww2zNykN68Xf5SS0GsJQlLR
         Uzg88gQ0QMLzFZ/d5z6o2RldbGq3egzf41+lsXjYrSeWBTSqIS3j5NgXsbyFN/oPXvjf
         MYn+paa6t0WQIUTZKlcmAfX3I619CLfjspcD4aJe3L3fA9qIv16buSPZxqksDY6HQu9n
         OgNhAne8+uKjFXNdpO7VJprL0V8qy4zG4p0cwQ6dVKnABuC6I5I3nCZPxhdNzaWywhCV
         t36k3r8rZT2NfXDJmt8b4yPgjiu8fPGD64XsfIQ3FRHPNWQylq/vSulKwdLe8Rjrbx2l
         +0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/o0v0Yr+auOrsddBv1qaqTGOkbqMwX+D9s2+D5scD4=;
        fh=VFP/qpwRbxZb8eG6UG7OeHKlV2nli+uvIspTIhEbqsc=;
        b=K7KYf+62/osxA6gAV/UI6JMvyeGW72sMJ2omsLUnyMNuJqVGYfJHpAkO35p3QP13m/
         vpbWh0xfvSqxSF/3nOdOMSlTWS/db5w9ZL/Os9XIaIAl050gK/imKyepaQoAux79DeFj
         1D/lEafBG1F1VnAEzjeQNj2Ycg7aZ2BFfaluADdK2jtLvFLxZX7lE39F5dz1iWW6vq8O
         2pIYRwvQ+Z2MpejBSyaa/rCZn5gubj1f4G6Nz9bwKLu76OX7+6PnfLsk/JGXDWMRAyyC
         olMN1FicUfnl2YYIP3ZYzOnkMwPr3b9J7pTDrLG3zXQVya3KoQiYuR8UuriAhnk7YwnA
         /yNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792095193; x=1792699993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/o0v0Yr+auOrsddBv1qaqTGOkbqMwX+D9s2+D5scD4=;
        b=Kz82OO8m5E1yYRnNfx2+mtQ9PpOqwY04VaODSP3nmT1fyZaaLUBMxNPNoJLlALDsg3
         DT9k08YRWAfMaKO1yKzAcUN27StDFB6CeYBfRhXITwsFCibpDOt7wnXkBH3xr4M69hNw
         0WvzCMvyxLHqASZ0Mj7kcVv/n9YHZeTIMg9DlixZJAMnaECpBUTS1z3Fa4FWz+VBepVS
         VgHtDQ1oy+SYHQhe4DWZs8NRzbIuQq57/mqMPAzCoU6JtAzManTIRh70Fl1QCNVUwlAH
         /RdAJDtLU6Ppu6+HGiflFVaI+VEwJj8S2DAQQwo1erjDHm2ZEi767BV7a8xoGWZVDRm6
         1fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792095193; x=1792699993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/o0v0Yr+auOrsddBv1qaqTGOkbqMwX+D9s2+D5scD4=;
        b=hwG1zAn44L/+eOEwNMO2/5jnq6TZayBUy09pNCIbS9bPzAeenatrgUS5AvhGycsM4e
         Zkh3bV/ms2B0xWst/9GG3koxk4dKcrA3C2bYa7OMCGk5Fbymvst+LT9LeY0VxwDTWsv6
         httetAzsvACCaCsVJUmLl3rATHz3k9DabQmz8+hmecA9TlcNELziHxxCmjzjxwKflGWb
         eJih2KUe9RzyuqczR+hoMA3WzTDToC+yshjYMQZJGLEE+A5gVjD1AsjMO13oK0jM1ObV
         +E7rDDUFOmPooYpf9ZcEIwh2OKaYwfD6ilTR8mSwNylH20Mn66kK/mu2f8+qb31ZwPAI
         9FZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTTa0XVsMeyIjeoWsVKnw82AFpRDa+iZRLLBepfjeg7bj2bMj3B/4pOxBKOyN7WGA52mYwOMR8wYwm@vger.kernel.org
X-Gm-Message-State: AFq9FYKVOlMu+/sP/uTISkPwugSPMl7nhF1Bq8wOnwNvOKsYLCSeDqBK
	uIm4McEAD/rpmO08C9bI9H4K0/E715HB7V22lc89TzyLZxI5RJWJARKYB+i+ZnSJKj1QATaL86m
	9W9qcS5OGwS5B/YV0ZQacVqW89a1yb9M=
X-Gm-Gg: AYBFou1Wc2hbFeTKeX5yFGYKQ0WCP79BK8mSFdgdwCsEJ3Td0hrXbGZPZfMOjTU2tsK
	qXjlB6gYbO2JPHteTnjeWx32SAo3RL7P1eZwU+hzQRGg+RzLpDG79OuuxbXrEGMKyFQajHrmF+o
	OAAzn61n8llZMPOO3D1IeMD8z+/A29pelFMOsIxgzbOHjfSftWIXLQ6z/Hxlcw5Cdu12bYcbNVz
	bTjOS7zW/vuF7ew/CEcYdoy+IV50k9CNY+WwrlDM0mKBKOWNi8/9Mi+FZDM1BZR5UZ+1/XKyyfL
	UrO7r+6iQe9zKad6FxZ4+e5KnC4Rp+/jBLt7IYjD84mlx1+i6R43ST0=
X-Received: by 2002:a17:907:c23:b0:c2e:4e08:19b5 with SMTP id
 a640c23a62f3a-c31a9d08813mr1787531366b.8.1792095192447; Thu, 15 Oct 2026
 13:13:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAUQFRPW-rbcZV-=qV1NMjF_358sdJTiGvQuRxRqAsehY+J9Qg@mail.gmail.com>
 <atEaguJD7dh7xNs0@ashevche-desk.local> <atEb6FN6ZbKI9xgf@ashevche-desk.local>
 <51c151fd-31cb-4ebe-8f3b-eb7634e68c31@amd.com> <4ba482fe-8b34-48ad-9d13-99ab532cbd97@app.fastmail.com>
In-Reply-To: <4ba482fe-8b34-48ad-9d13-99ab532cbd97@app.fastmail.com>
From: Nikodem Sanecki <nikodemsanecki@gmail.com>
Date: Thu, 15 Oct 2026 21:13:05 +0100
X-Gm-Features: AclHuK_6IVWJuTXkQAqot5n8Si7rebYbfwRNkP4YoTlgAmN-6AwE1BlCMyJKGZ0
Message-ID: <CAAUQFRPDq6zdyySWtGM8i_uq-iZJK1qpvCvxTrRweLmS2+-AMg@mail.gmail.com>
Subject: Re: ThinkPad L13 Gen 2 AMD (21AB): Caps Lock LED broken by ACPI GPIO
 11 interrupt conflict
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Limonciello, Mario" <mario.limonciello@amd.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Abduvaliy Abdulazizov <abduvaliy.hbai@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, linux-gpio@vger.kernel.org, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for looking into this.

I've checked Lenovo's website. My installed BIOS is R1QET54W (1.40),
which matches the latest advertised version. The version history on
their website appears inconsistent, though.

I also have the sanitised ACPI excerpts and diagnostic logs ready.
Given that a patch has now been submitted, would a kernel Bugzilla
report with these artifacts still be useful?

Happy to help with any further testing.

Thanks,
Nikodem

On Thu, Oct 15, 2026 at 8:25=E2=80=AFPM Mark Pearson <mpearson-lenovo@squeb=
b.ca> wrote:
>
>
> On Thu, Oct 15, 2026, at 2:48 PM, Mario Limonciello wrote:
> > On 10/15/26 13:31, Andy Shevchenko wrote:
> >> On Thu, Oct 15, 2026 at 09:25:10PM +0300, Andy Shevchenko wrote:
> >>> +Cc: Dmitry (as it might be related to keyboard configuration), other=
s for
> >>> the previously reported same IRQ on the same GPIO controller but for =
some
> >>> camera stuff.
> >>>
> >>> On Thu, Oct 15, 2026 at 03:13:02PM +0100, Nikodem Sanecki wrote:
> >>>> Hello,
> >>>>
> >>>> I'm reporting a Caps Lock LED issue on my Lenovo ThinkPad L13 Gen 2 =
AMD
> >>>> running Arch Linux. I found a workaround that completely fixes it, a=
nd I
> >>>> hope the findings might help implement a permanent kernel fix.
> >>>>
> >>>> *A quick note:* This is my first time using Linux, and I'm a complet=
e
> >>>> beginner when it comes to kernel development. I used ChatGPT (GPT-6)=
 to
> >>>> guide the troubleshooting process, analyse my laptop's ACPI firmware=
, and
> >>>> interpret the results. I personally ran the diagnostic commands and
> >>>> verified the observed behaviour, but the technical explanation below=
 is
> >>>> AI-assisted. Please correct me if any of the analysis is inaccurate.
> >>>> Problem
> >>>>
> >>>> Under Linux, the physical Caps Lock indicator LED never illuminates,=
 even
> >>>> though the Caps Lock key itself works normally.
> >>>>
> >>>> The LED works correctly under Windows and during certain stages of b=
oot, so
> >>>> the hardware itself is functional.
> >>>>
> >>>> After investigating, GPT-6 identified what appears to be a conflict
> >>>> involving GPIO 11 on the AMD AMDI0030 controller.
> >>>>
> >>>> Booting Arch Linux with this kernel parameter completely fixes the p=
roblem:
> >>>>
> >>>> gpiolib_acpi.ignore_interrupt=3DAMDI0030:00@11
> >>>>
> >>>> The Caps Lock LED now works normally, and I haven't noticed any othe=
r
> >>>> hardware issues.
> >>>> System information
> >>>>
> >>>>     -
> >>>>
> >>>>     Device: Lenovo ThinkPad L13 Gen 2 AMD
> >>>>     -
> >>>>
> >>>>     DMI product name: 21AB004LSP
> >>>>     -
> >>>>
> >>>>     DMI product version/family: ThinkPad L13 Gen 2a
> >>>>     -
> >>>>
> >>>>     DMI vendor: LENOVO
> >>>>     -
> >>>>
> >>>>     DMI product SKU: LENOVO_MT_21AB_BU_Think_FM_ThinkPad L13 Gen 2a
> >>>>     -
> >>>>
> >>>>     Kernel: 7.2.9-arch1-1
> >>>>     -
> >>>>
> >>>>     Distribution: Arch Linux
> >>>>     -
> >>>>
> >>>>     BIOS: R1QET54W (1.40)
> >>>>     -
> >>>>
> >>>>     BIOS date: 2026-04-14
> >>>>     -
> >>>>
> >>>>     DSDT OEM ID: LENOVO
> >>>>     -
> >>>>
> >>>>     DSDT OEM Table ID: TP-R1Q
> >>>>
> >>>> Diagnostic findings
> >>>>
> >>>> The following is GPT-6's analysis of the diagnostic output and decom=
piled
> >>>> ACPI tables.
> >>>>
> >>>> *1. Linux sends the correct keyboard LED commands*
> >>>>
> >>>> Using bpftrace, we observed that atkbd_set_leds() consistently retur=
ned 0.
> >>>>
> >>>> Tracing ps2_command() for command 0x10ED produced:
> >>>>
> >>>> SETLEDS: value=3D4, caps=3D1
> >>>> SETLEDS: value=3D0, caps=3D0
> >>>> SETLEDS: value=3D4, caps=3D1
> >>>> SETLEDS: value=3D0, caps=3D0
> >>>>
> >>>> The driver reports success and sends the expected Caps Lock states, =
but the
> >>>> physical indicator stays off.
> >>>>
> >>>> *2. The embedded controller tracks Caps Lock correctly*
> >>>>
> >>>> The DSDT defines the CPLS field at EC offset 0x0F, bit 7.
> >>>>
> >>>> Reading that byte through the read-only ec_sys interface showed it c=
hanging
> >>>> from 0x00 to 0x80 when Caps Lock was toggled.
> >>>>
> >>>> Enabling dynamic debugging in drivers/acpi/ec.c confirmed that each =
Caps
> >>>> Lock press triggered EC query 0x78, which was scheduled, started and
> >>>> stopped successfully.
> >>>>
> >>>> *3. Lenovo's firmware controls GPIO 11*
> >>>>
> >>>> The DSDT contains:
> >>>>
> >>>> Method (_Q78, 0, NotSerialized)
> >>>> {
> >>>>      If (CPLS)
> >>>>      {
> >>>>          WFIO (0x0B, 0x00)
> >>>>      }
> >>>>      Else
> >>>>      {
> >>>>          WFIO (0x0B, 0x01)
> >>>>      }
> >>>> }
> >>>>
> >>>> The WFIO method writes bit 22 using WMEM(), targeting address 0xFED8=
1500 +
> >>>> (11 * 4) =3D 0xFED8152C.
> >>>>
> >>>> This appears to control the Caps Lock indicator using GPIO 11.
> >>>>
> >>>> *4. The same GPIO is declared as an ACPI interrupt*
> >>>>
> >>>> In SSDT12, _SB.GPIO._AEI declares GPIO 11 as an edge-triggered, acti=
ve-low,
> >>>> exclusive wake interrupt.
> >>>>
> >>>> Its _EVT handler includes:
> >>>>
> >>>> Case (0x0B)
> >>>> {
> >>>>      MSTP (0x3911)
> >>>>      Notify (\_SB.PCI0.GPP1, 0x00) // Bus Check
> >>
> >> This looks like some GPIO related notification. I dunno what Windows d=
river does.
> >> Mario?
> >>
> >
> > Honestly - this sounds like a copy / paste BIOS bug that they copied th=
e
> > SSDT from one system and didn't change it.
> >
> > I would think quirking it makes sense if the BIOS isn't going to be fix=
ed.
> >
> > Before we go much further can you check if this is the latest BIOS?
> > Check Lenovo's website, in case it wasn't brought to LVFS.
> >
> > Also; Mark can you ask BIOS guys to look this over?
> >
> > It sure seems like GPIO 11 shouldn't be in _AEI.
> >
> Yep - created internal ticket LO-4711
> Just a note though - the platform was not in the Linux program (and is ra=
ther old) - so my expectations of getting a fix is rather low I'm afraid
>
> I'd get the quirk ready, and if I don't get any feedback from the FW team=
 by next week go ahead with that.
>
> Mark
