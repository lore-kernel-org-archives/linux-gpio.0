Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792937944;
	b=WnZ+hN103JySZBZtk6SS8UwCpunegDCMg06wv2cas2qx+53ZyyG03KIi43D6x31bs5MT
	 lXQvg+nt3Wg7bk4r/iXpwwKKpd5zP1f9fAhIjJoQYyouzRWw8IT0c4SSkS2zhAdVHfCUp
	 BAeKMatPSk2YXwso6z3VFSrhKWu1b73og9LjKw61CTKGO4XSHJL1mgsXspdr+9kdtVh6/
	 JEVA1/qWPNnnUONRLO81NUZYIrqftkwGapSzqmQLyyPPCBg8pPFufNUFtFnquTiozTsvG
	 LC+bp7mAm+d7D9xZ1EG6Hd77GX5eLLl9N2T1ligbmWvKNsSN7Bqa6PZh9aSduPIWQeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=TZluPrXQwqjXtBahn5BT9paHFwK9CvKp93YvhUt5EeI=;
	b=FNDt+sC+NzC38z2OYn75/rTHNCMqiXFiB6QjYRcWgz8GsUNxAkEqFkb0by24yhKri/Kl
	 K+B9rhF6ibhac/cpCPRQZJuDCtkHnomtIrr6XtZbyTXUvCvxba1UOy5p5bH5++mbnp4EV
	 yYSCiehlPcX2k5k6Kp4A2QvoEq5RanmhmDE0SoVTK5BM9lXptEiGR2DRUyafbmvXW5JY9
	 GcjvVCTUwF/tey1QlAU4FeSsW93AG1uailWd9c7zp19quXGCd0yE39t5NlOhit67h3luN
	 iribQlT4KNy9VkLT9QFeQmrh45U6MFQ758oHLyWVcQJ/SsYwgxQl0dQ6q7kxBG4HcFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BC315eEc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF877606A325
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 14:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF877606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BC315eEc
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e7e742a2c7so14303605ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 07:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792937943; cv=none;
        d=google.com; s=arc-20260327;
        b=gsCrCEB4NNC3KK3ACmZpKcKMes/rddkPS99oYq1XySJUwVHP7GFAYFw3tdHWFxLwqV
         Wwt2Qoc7VVXsh8T+Slj9XgaJi3N0CDN7IjdiZX62SX3PotFBNPxV9uqBla/anVNscTGG
         UIUsflTScXdoZB2r4+8pRguFIGprqLO7KMykYtUcbGPRXLJxpeeV6K//1+JePVbRWEff
         FVBMpXqHNDeNNNqntCoRnZYJgN6CFEm55yjV0LltdGJ/KCHyQDNQGFCPgjzGWWfLdpdD
         DeWlEaRq3m2OTH2/2aYRPTUM3rbWYK8vd76md1R9JU/3+ZZUdYr9qPHauHTTix+fKUN1
         z8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TZluPrXQwqjXtBahn5BT9paHFwK9CvKp93YvhUt5EeI=;
        fh=tuLHQaXTRDvVtDW54u9vlEPU1dFTJElIgCIgXp/lixY=;
        b=MwzIWLouEZdQnpVv8Oa6OQVgQrokGD1WN+QvhLGIcKLY7mOTON3oJmmQAH1XVR/ieS
         6rMT+J4Zr0mO4OSzcZbNAsDr3I70Ak9vVhGd8c4Xt8fGbaec3F6x91l2Mz/Ly9jlHdr0
         s1qXBtBGWN8qKpeq5OhWPKrVvJ6VyJF0yL3/kzoqNlGiRrRAIfpk7kNKzRTWwXCCUBaj
         jum8ljAZnabct30gXihM3o27+GobUuAwBPd7Ki3smdlLm4fkIS+43Ig5CIMzrk9CnKil
         SMdXDJ9u6X/06/0FIpeLbFL7ieVKEEJiCwH3MS6uJEzAlzAYZIpSm2jV+SYFWiaE5xS4
         yTAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792937943; x=1793542743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TZluPrXQwqjXtBahn5BT9paHFwK9CvKp93YvhUt5EeI=;
        b=BC315eEcx9OO+sSda4vK6N3UarWHSm87kxgH+IIyjUXTnCrooTdApf4YWFHDsakzWl
         kqCcy7r+qnYdimCRoUVCYBwxG2GP495MLZXFt/duKzrbR7p/E65Wftn/K0NIXij4Zu1z
         1Jzd8HMqiX22Ud2Xx5DcJkEDjfX9cy02DzCyUlImBKyGydCdZcTpsxJ4/fplpWnENo9f
         890VTBMSOgy2bnQD2U74p5xDkWKu79Ulj6xdU1UHY/pij8MJ2w5t3TvlVmyHuFss1aVA
         +1z8f40ljI7Ehu0XWejhPZ6s5esUDnwDYES/tCcgtggTiJHVawwvLh2et+OXRzujFwtE
         7knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937943; x=1793542743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZluPrXQwqjXtBahn5BT9paHFwK9CvKp93YvhUt5EeI=;
        b=AgX1UGuTv0C31+C72lL8+8d0cIAUD++Hrq9wDFxDD/iM31i3yJQ1ziM8mlH8LvHgdJ
         peaNroun8rQ9aRInaQO21KWBUtSn90u8/aTGgmjb6l8Hdjxithw9pibtv6E10c0Zh3+t
         YBg4Hb1BYa7CT1FD2K60YA3OUHy4AAAhAGsI3YSked6bBKmkaZLzpNwVW0io9pOKF34t
         HO7IOoDwLIij4h/fwPp/AShBv/XcBtEnv+yuAMOJlupdessLOr5dKgWrxN2n5nJqnltf
         aJXkh83BFpWp5D/jJJ81jdUddZHxh0jYOcbAYqnnGuyiY+dvlGJyvW7QKyPgCeb4gNHR
         guEQ==
X-Gm-Message-State: AFq9FYKPTJz4owNiPfE9bCcet28cW+ms+3votIq9xPRcEGPISbLjUlQZ
	TU0GeGGjbrn9hfigZi9Wvkz/IFmPV8zHjeOmCJIiO9RzInrWC9Q8ms6/vUIF1MQ96y7PsJz/i+L
	Jtq9lRhlnqbJvAMvKHLiPwELdzdSeDbU=
X-Gm-Gg: AYBFou23W6JXdU78bKWE4AMpCZBtEZmbLWXBP+AjA/hyDR6Hc7jpQSjYwDc/9V0FWkk
	yHE5T4aUlw2dss1CWn//98b/EZJAuSLdDTXF+IIpalYPdiVx2v70MVGbjjpSGYfWS31gYo/1vsN
	kJsalgIWEvLAtB7VqxwHi88JXmst1RXMTfOcCmlMbQKTUHCZIylvp663wfj2tHWqFLO5+qMhKn7
	idM9clehD0p8yuwSgvWkxbn1wwTLDWvPEtS6/NKmvhVOaDP0iWL95EseOzYHYEKkwhitn/IGVaF
	Q8z7rsXvoatHE4WBBqwWBtbZXHijyEqi+3YVLB1giRjbPK2KkR80A+S0alDNE/FiU8g8PHXgwFh
	MbApFbMRJgaQh2zZ7I78yO++s6MAeB/wNtnz3LqGCAbNxhi2JoZVS
X-Received: by 2002:a17:902:da83:b0:2e9:5d1f:dfee with SMTP id
 d9443c01a7336-2ea9cc412dfmr26382595ad.25.1792937943129; Sun, 25 Oct 2026
 07:19:03 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025135745.102970-1-pmazzini@gmail.com> <20261025135745.102970-2-pmazzini@gmail.com>
 <sashiko-outbox-184239@kernel.org>
In-Reply-To: <sashiko-outbox-184239@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 25 Oct 2026 14:18:52 +0000
X-Gm-Features: AclHuK9uayK1Q4Gg7-cQO0yGAiMLLbnHiMvUXBCuYd6DT54wbPEG5TiYn0ObdR4
Message-ID: <CAAxh=jsrVwRfdUKdGxJ_5riNRiyCmVpTzQkg5W0ALgtPHRNuxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: sunxi: dt: number the IRQ banks from the
 first one that has IRQs
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll fix it there in v3.

On Sun, Oct 25, 2026 at 2:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] pinctrl: sunxi: sunxi_irq_base_reg() ignores irq_bank_map on A73=
3
> --
>
> commit 1d99efa95c547fd409284e1974176bcf35345f69
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
>
> This commit updates prepare_function_table() to number logical irq banks
> starting from the first bank that supports interrupts rather than bank 0.=
 It
> also updates the irq_bank_map tables for the a523 and a733 pinctrl driver=
s to
> map logical irq banks 0 through 9 to hardware banks 1 through 10.
>
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinc=
trl/sunxi/pinctrl-sun60i-a733.c
> > index ca82f08a3a65b..3ebe926a1bc6b 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> > @@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MA=
X_BANKS] =3D
> >  /*     PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
> >       {  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
> >
> > +static const unsigned int a733_irq_bank_map[] =3D { 1, 2, 3, 4, 5, 6, =
7, 8, 9, 10 };
> > +
> >  static struct sunxi_pinctrl_desc a733_pinctrl_data =3D {
> > -     .irq_banks =3D 10,
> > +     .irq_banks =3D ARRAY_SIZE(a733_irq_bank_map),
> > +     .irq_bank_map =3D a733_irq_bank_map,
>
> [Severity: High]
> Does sunxi_irq_base_reg() actually consult irq_bank_map on the a733?
>
> With the change in prepare_function_table(), ports b through k on the a73=
3 are
> now assigned logical irqbank values 0 through 9 instead of 1 through 10, =
and
> a733_irq_bank_map is added here to map those logical banks back to hardwa=
re
> banks 1 through 10.
>
> However, a733_pinctrl_probe() sets SUNXI_PINCTRL_NCAT3_REG_LAYOUT, and
> sunxi_irq_base_reg() in drivers/pinctrl/sunxi/pinctrl-sunxi.h handles tha=
t
> layout without calling sunxi_irq_hw_bank_num():
>
> static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u1=
6 bank)
> {
>         if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
>                 return pctl->bank_offset + bank * pctl->bank_mem_size +
>                        A733_IRQ_REGS_OFFSET;
>
>         return IRQ_REGS_OFFSET +
>                sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
> }
>
> Because the SUNXI_PINCTRL_NCAT3_REG_LAYOUT branch multiplies
> pctl->bank_mem_size by the raw logical bank index instead of
> sunxi_irq_hw_bank_num(pctl->desc, bank), won't all gpio interrupt registe=
r
> accesses via sunxi_irq_cfg_reg(), sunxi_irq_ctrl_reg(),
> sunxi_irq_status_reg(), and sunxi_irq_deb_reg() on the a733 ignore
> a733_irq_bank_map and access hardware banks 0 through 9 (ports a through =
j)
> instead of banks 1 through 10 (ports b through k)?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025135745.10=
2970-1-pmazzini@gmail.com?part=3D1
