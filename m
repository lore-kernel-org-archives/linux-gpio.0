Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260648;
	b=IhNd852l9qiOON5ZC//pLgNvDJOeIPh9+4yR6XJ5V1X52ShyeLApwHs8R5ApcqLceB98
	 8wevFiqyUozbOXAuRJSLWpTrVTsJBetLVpXBvZP98llS1xQecunaQ9sA2bRmyOw1gspPJ
	 NuWgeNXVw6M3nTjIuCA+qjTAqUYfBppuCVBKy7IjT1N9Sio/SDmDS1B9ceb/vjZKksmIb
	 jxQMa6aH2tTOK6S7uKqVijTHKlEKYmXqCWIQFLFV0hmNby/F7ih+cBtIOfmDz/I1VvWYh
	 2sUp8jHLTQDY4ra+5tvC/OGEulb54UZ5jRFdAXdFVPa0wEppYwBVO2Zy7t4Oo7mBN/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260648;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=bnlmMEizUAgCV8+p+ZXesD4AYJNLVCQuj4kNgrtTkYc=;
	b=KjGGW/aQdMk3ctVyAPUQ6yAgxLLdAAmlZaE2r+V+IRH+CBCxWIA84YyIQ9ozhTzXCfcb
	 SXylAlsDfZzzydauT+KZ67qGgg1cUTURh+D6g0VNxk6/RDSpUIUshe+rJ+p9ZxD4v5bQD
	 XtmUovFONHu2n2loQ6TBZo+7v4C+UMcPys9quwoqB1LTlOUoLd3hzUsZbzxctENQ5cIyf
	 vfFRJe0lgVLwc1McnMJsG/ZW5x2x8p5sjN7DRmYD7+SlEdqOriaRNgaSKpsAdZEUhccu7
	 Bw5QRZRrPbnaNyMX4jJxcAZoqfn07/28HDPyD0h7+QNpacoh7WrVhqbyQZ+V+ZN4REA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3AF606A329
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 07:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF3AF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-990703f817fso967151241.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 00:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260647; x=1793865447;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bnlmMEizUAgCV8+p+ZXesD4AYJNLVCQuj4kNgrtTkYc=;
        b=rkCyVRtqxC2556qhZtZG298cYh5mHmSa1zHR/8rMdwISymq5Lnn+uJS4QkJmkaEV0z
         X9xb6OJ8AeoEFDwuxYbnaWF4VG5d7x4W8Uexi/y9ZlHd2wtss7finwGfBjIXlgF4yUdE
         AGPcSY61GxQ0EuQHilTsZMljT+2Fd2Tc/uJCfjWVaiYy2dStPK6N0/JsQMQng1x+kiT7
         3DSorE82LbEAgT7beuY5t8nSolRE8APU+OQAekZa3b+xV53dLdCF8KfdLvf61GXzNpKm
         BChpSgK6OiMPwymFxNgkptY57fwV89RKl1W+4dI/qiHoEfkPcDqOk1I2FitV7fY7iB6J
         WlKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLCJWl63yhUQAkyy1MR31g9kDRHP7rJEJBjssAFQIeTywjKDjkbZcfW6p4+OUPphoqO9/W+1/aFRpl@vger.kernel.org
X-Gm-Message-State: AFq9FYLobPZOp3HhGge+den4omeqn8nC3wzD2PrSEnj5OdEZ7Skg3CX7
	O9qpLc/1SsSBdxMEHOZdtoqDxI5AWQRqSfTfFHZ1Q3q4IiXREj7hDz5IznJ7JcZ7
X-Gm-Gg: AYBFou3lhx1y7RHhm/ZHuco85jKguq+V9zaORoLnJxsKkxVwWxGjDwz8kX7OdGjlzO4
	SNrJQaMC69PEMs10PiBbnlumiZkxP4yejloYVOj4ecXfJj2HBzBNQfWoExMU77Ea19LYxy2a7w0
	xsrss8M901j/zTTetoruG3ucWayKwfbTt4tttBGYusbmv3vBwZaxaEA0stha/k2/07VqZ7HrTMs
	vWCa+BzGHxapuLN64SEDDVXihCsqVcyfeK/PMBY3lFZCjX/kZQmoXVUwmicRzYAqEwIpumNA7G0
	5mtx/KTQg5Kn4jezcT6crxoJtU1ofBOwUima48VTfIF23cceM1lIgB1SS5u3dXWzfFyjme5vl9d
	LqEVpubiYOejdkOaULyALLIJCJhZNinRBHmiJyyyeQWWPaY+xC0R0WkKOpAwoDtxN32b8+gIBPz
	izY/g58z/3ZA7SLh5gkPNPYCA30GhcbHcKKgvZdkrYZhWoeVKrOSr74wT2EQ1R55aorDADkj/Iv
	QSPVVs38kmRWyPtgt3qn1tCtoFaZtfMNKSwY+jyhjrVUJk2oo9AyNkb82+4z7PqG1Hfikls1ZYq
	5unyZLoO0mQcMQ24or880HQk9IGjo4GDgWPBhTy0eRmDvL5sDNR+hc1ntFBmTDninZs=
X-Received: by 2002:a05:6102:390a:b0:7cc:33c9:b3cb with SMTP id ada2fe7eead31-7d03a5d4bbemr2305220137.29.1793260646862;
        Thu, 29 Oct 2026 00:57:26 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d28d59sm8450638137.8.2026.10.29.00.57.26
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 00:57:26 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9906c3fc88cso813631241.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 00:57:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwOEbrNdKW/EYupsi0wTToTZfhgU/kq5DfbQkwTdS73ZAZzKEIm2D15IfECbu4UqMG82DM5AXeediPi@vger.kernel.org
X-Received: by 2002:a05:6102:448d:b0:7cc:1967:5e3a with SMTP id
 ada2fe7eead31-7d03a5e4ca7mr2571146137.32.1793260646444; Thu, 29 Oct 2026
 00:57:26 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
In-Reply-To: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Oct 2026 08:57:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhBeqmMt-VXbh2u6AvzyQ6NsZAzATNRZCnm2DHUAFUFw@mail.gmail.com>
X-Gm-Features: AclHuK-fwV0Ywnec5fo7ksIRhkmYl2FqOpWfbqGPc6rEoPI6YKH1NmsrsMsnUlA
Message-ID: <CAMuHMdWhBeqmMt-VXbh2u6AvzyQ6NsZAzATNRZCnm2DHUAFUFw@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: constify struct configfs_attribute
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

Thanks for your patch!

On Wed, 21 Oct 2026 at 14:31, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-aggregator const
> and use the new st_attrs_const field of struct config_item_type.

This has a hard dependency on commit f7528cd38b87fb59 ("configfs:
Allow the registration of const struct configfs_attribute"), which is
not yet in gpio/for-next, thus  breaking your build.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Since you have to rebase anyway ;-)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
