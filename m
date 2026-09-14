Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945BA46DFE3
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404832; cv=none; b=DqYdyGNEGsY+rkR5dmnT/jye4jzWRMLL1tbSgxNuuHZ2d51C4K23RIqL+ynJIyy2AeXc3WTIYnsXJICw/+zXRlgS+HI/6V00GWDBZepWh0Duh+AbIt/RVUa+sb8KxQYe/qtbBQWnwngUmyC4iOwvBvUC6fgTUE95lN20H97CpPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404832; c=relaxed/simple;
	bh=Mh6gEpsA9iJQYd2BVSlqJWoSIMsA9HSAvPlTaQn8dqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNxfNCMI7ImxbnZ875Pbw67xj4x+BD3hHsTkKIBXKqQuU/Xvvc6ON/gPY4oc7Y7WtoPRXnD9ExhlFbIdKOqXc/qMiMCf0Lc3Q/Zv/G7cuhQffF9L9VG9KrjvFJ5lzoWNH/0yGS1wtDy701CZOAB/HSTBIJv3LCb0BlaALowg/w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78564421fdbso653834137.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404829; x=1790009629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BQG/EJqnowJv9xXbgTYVxf8rMoXWD6yF3WQVjoo8UXA=;
        b=MmN54146Zn+HxORgGwrQsEzJ8t/RDrmjVWPadWJHDwMo2iSR/GM84QmofJ9JJDL74b
         E4I0AvNOPaMmbLmr9lPZHYlbKxK9hFJ/U1JuLTdwomIBUn45YvPQ85rd6PJqY2DP74Kl
         kWEovkWjHHhcXkyIRLR9wPqCNFexdnC46OXngljwh3hxJ0D6EubytoWnvP/HwMSVbZTD
         +hoDmrfjdEwKcF6UV2q07LLlVFoOL7Lgt6subfXkkehWxT/NIg5BtnApznKFq1n4FoaM
         TAQexzNlbFprBQCajFz7HTZQp45pR1x4SxPV4ZgRQgjqOmt+QPzFebi7rZPQJH7Ob8gF
         n/zg==
X-Forwarded-Encrypted: i=1; AKwUvBxXQrnMeHXBqzfrveFGEpqXu0QxUoFTBm+FQWU3cG0VJR2c5zVUaDmchbqYXwa7zluMAw+dCEwnQv9s@vger.kernel.org
X-Gm-Message-State: AFuF++lPB8AgCD2FKoEUCenPSQ6pvlNM2lLYTwhje2eC9CTQbI+usEmA
	9c6dTweTJqyolwaUj4BZXaK6NzdfoMzRCXONPzkJYusPW5ZqYObooDY0+CnW9P4x
X-Gm-Gg: AYBFou1SaA3+kwFy/yShEeuEKGMsBGZg60z8YNgRH8O6eZngu9lFNf/+w/o9Qp6+XfF
	mbeFS7ApYN4hcOBVxF5FMWS+AIMgB/uaouSZc43VOZC2b954tnq9++lRGOMnFyg2/6W0Fx5Gclg
	aZbcDI7lPFwadYbG3n0eClhkHWERYdHISMGMGknC+cOi8hgjF1XZlN60fuvoHIbX8roxsHOdXEl
	VpApcCuu5u885XG9P2w3rxCPcDipEAX9SdrhXT5ZrclXrWXLCD/e/V/+LmCOIHlRpWEvV+6LSUF
	yLJTsglzjPEIzcNk3RuvxsZDX/Wi2z/BoOdpGoTLZyMjTSi3M3HO7y1f5eSPCDY2yr5Mgo8mwvU
	nC8wNtrk5cqhoDdP858FF1C2B6si+q0OqtEa48AZPQGdYbGCLnQVX+Bug6/IttYjFIXhaBHhZkk
	+fjRAWxwM5mIcCgc8ongN7mTOFPRweXYfvkOueGjTUfcswUctrejWqgjW1XUw3SN38Xh3pD7+zq
	W4U+sxTz5Nnef9n/sGyo7ycnu2ENqr5prcFX8foqbUqRUo=
X-Received: by 2002:a05:6102:5e8e:b0:79c:9ee6:b4f0 with SMTP id ada2fe7eead31-79c9ee6b760mr884094137.9.1789404828991;
        Mon, 14 Sep 2026 09:53:48 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927cbdf17fsm10823130137.3.2026.09.14.09.53.48
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:53:48 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-791a9878aa9so885055137.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:53:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9pRRxxFetpOHsb8yNj5P2Sb/lUNgQnOHk+BCdiDAaeX0d/E2CLWqcfuGUSJEBRS2528PmnkIPCPXu@vger.kernel.org
X-Received: by 2002:a05:6102:160b:b0:799:e1cb:d690 with SMTP id
 ada2fe7eead31-79b56df9c48mr1219613137.1.1789404828557; Mon, 14 Sep 2026
 09:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:53:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8bsr7-nrQeNdrhT3Ohmbf+ODv-JOGEREMqRd378YYNw@mail.gmail.com>
X-Gm-Features: AcwNN1VcbIN-WIOpxXaGvhcx7QEKLAAdG5tqWb6e4fPVkeaziyHmblEewpvcoBk
Message-ID: <CAMuHMdW8bsr7-nrQeNdrhT3Ohmbf+ODv-JOGEREMqRd378YYNw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] pinctrl: renesas: rzt2h: add a helper for reading PFC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Introduce a rzt2h_pin_read_pfc() helper and replace the open-coded
> implementation inside rzt2h_gpio_get_direction() to simplify the code.
>
> While at it, use field_get() with PFC_PIN_MASK to avoid the manual shift
> and mask.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
