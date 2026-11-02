Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633680;
	b=SidE3UbkAR30t+dPsLRr+uuvWq+xtdbiGGF3JqgYx9EKx8Bp4I97kqCag+2xkXKZDyGC
	 LEiDCFAty0lYTIerpZodU38ZKgDAJsSszvDpsIgaQn98J6Lxm5nRYUhW+BI/TlmtnDqV5
	 HLp+VIafi++l5ZawBzYxlmBVafOGQV5dIIhrVym/87o0kSsh/8nSSrxMikuhDdielwZkS
	 6WyNfOwkotrWhIP/+RtrSKZDAotN9gA52zbep/KTglWgTtBI1/TkclbxSVmEPqHAdoJ4f
	 HXLwTN+s7bKoU7LllJd9HyS1TtlbvvURsu+XFHnJNfSlbh9R64tq44+tR+HTUl+Xw9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633680;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DPzzjXN6693zqek1Hiy4e6/v6L1e3dbPSTYAvN3gY8k=;
	b=zAzlya+eAhssB1GM447jAeWXOyeRJ0dqQcFJeYJ6UNINFmjn5vL5vmjfTL13rnEUzWu7
	 c7UJhdWjX5URDkVefxfnhhllgKaocBuXatn4AJAT9fBCohcpRSHyR68d9RFBAhPdfQzjt
	 U/XL2aFPC/EGj/7NLtGWuqYGxodF/J7MOczTdlDrnes91JR72e/Xth3X0kzIarBcmDe/k
	 5iNO7++aK4KS29LZ+ykg8PiN+tiTfChlKAK9DASJAI4g6DOco0liCVRI/VHXKvPaMVOwO
	 /whwJrwCqrW8Xiq+gUD8trrbMHAa4jBU6aG+5jgPbPO2HE08zKEwoq0H0CzhokJ7G0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E542560A0C8F
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 15:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E542560A0C8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso4193117a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 07:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633678; x=1794238478;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DPzzjXN6693zqek1Hiy4e6/v6L1e3dbPSTYAvN3gY8k=;
        b=HQOihwhCzvSPbuECHKGmI+jh8EBxr+sDEMlDJIroeBETNXEVuIhvYACFOeiNqPc9u1
         MiXtwuC0I0EtO8Ab1RMt1sA5zP4cM8O++GJ0IHLIRd0Na71gK6YesaC6q51i+Jr+MOnW
         bIW9+zQlVCgbYRsZ7w6/XrCBT6BUSGqdrL+Lr3dX0E+VNJNwv98EVwM9A2J0S9XZO5Yo
         iVuC7nbgmriC0ArIawJr3mmgqIN/Nb6djMdfGK1dHlL1T07BotSJogTJvTYpllYDH36Y
         0yROSwViQvGBbGt6rzxECtCxiVclJPIZECY/jJprtCiQCV7n7aPb7OXcNN8dGZ6ivlPj
         2rGA==
X-Forwarded-Encrypted: i=1; AKwUvBxhPoFZK1jvVfUJ5juAtxkUSSDjFr9Msb3xYq3dkpEERt/ww+aPO1osinSI8vYH4TK5KpnDvZ5HBVNE@vger.kernel.org
X-Gm-Message-State: AFq9FYJuYOCm2aS1PwMZ1ObgvLFnP69F/rlCdIpNSCqaFZwK1fHuXrXF
	9VvPsQOSZTopyB5inNKSCI1R2OfMDAL+Q4dCza/bxuqAJqQJYaWdDhTP0odAbcvn3bA=
X-Gm-Gg: AYBFou3fmenSlf+CSrfrFhbA0iqlaoGJAxDkWsHve2+INh3EGz2cSsHhLZOsJ8GZCdr
	we38Ov12KomuzDIafzk2cayiJQ7RdGphO0WIdUHn7erno90GtbzmXcLZGO/RIGQh3OTR0jOnGDC
	GDFc+nEEt3bJZ92O1nrXdu6zibJdG9l/iTQ2fW9RLN8HQjcmB0vkpgVJct/JPO/cNGG8TnsZXWF
	I7Hc+K/dMjZTBvVFD/lg//mdX0q+ennkLA6iWDQsOH4gYSb2dkeIPKHTsQi/N8SzlzaqJJVnPGQ
	en0Xreh884UmbBC9zHxaeladWeEsGVs84qA0LWswx9IA27m9ymxTdNTuZFWMSRdoeSvkKPe5OiY
	aTX7epHzne9J3AQB1Wsj9fElUDSdHj5IH1s332u//IbGvvPv10ubZXmELn2UjkUxUmeT4Ft+r7y
	ED6mtTF+WoptLB/jpNLed9p1AtU2PzMD/4Icd42vT0P81jkQF2Pg5sY30Q37u8bufPNNR9+2QaW
	U8FlciAq8vqtcNzFLW5fRJEHKRsOmEqO+ZHoFIh2LZJ8uJIzt+uXVCNF82EyfxDho9HX3Lo7Shw
	LLQ6VE00vtM+GTuYC8FJzGNMGLIvu5CgYZSPtC1UnOtrUwxNt3vHWB1TVOhy1oYIO7s=
X-Received: by 2002:a17:907:9606:b0:c40:4320:de2c with SMTP id a640c23a62f3a-c4ca7a0dcc7mr928675066b.15.1793633678245;
        Mon, 02 Nov 2026 07:34:38 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebefde4dsm2092266b.39.2026.11.02.07.34.38
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:34:38 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so3296994a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 07:34:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwmWjtpIlBNlhZxP4LYqRoByM6jSlZg110Ob5cT7Ipw7ReV/5EH/yKAZ1icGeJC+qnPXBGjZhEl4mNv@vger.kernel.org
X-Received: by 2002:a05:6402:c4e2:20b0:6ac:b3e7:2357 with SMTP id
 4fb4d7f45d1cf-6b4d468b065mr5425290a12.21.1793633677911; Mon, 02 Nov 2026
 07:34:37 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com> <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 16:34:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqKB9Uci115CtDuiUZbpR=K7TM+Y+doQTBf1hK+LnA+w@mail.gmail.com>
X-Gm-Features: AclHuK-3oq7-ogrLm01J4yJ4YAWbiD82Sz0qQlli6C8IYRXs43BlMTULNtsTBro
Message-ID: <CAMuHMdXqKB9Uci115CtDuiUZbpR=K7TM+Y+doQTBf1hK+LnA+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] clk: renesas: r9a08g046: Add I3C clocks and resets
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 12:36, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> Add the P5 fixed clock, the module clocks for the I3C Bus Interface
> (pclk, tclk), along with the corresponding module resets (presetn,
> tresetn) on the RZ/G3L (R9A08G046) SoC.
>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
