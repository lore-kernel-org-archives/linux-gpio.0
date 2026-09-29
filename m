Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7A54E3EF8
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672501; cv=none; b=XGm+NUtP7tFsXHj5Y+0pz0S3109kAwkCsM43ENWZWg7Q2LFLIW00k24BqdpbvoidUryYbFmhwlXOhbWEEyCnI4ZwR9h7XBPhEE8TDZ0ebS5n0znzuCDbRR6br8qw4K9B96mqKtUlZc2zsvmIwmqsErtDVqfT/s6WtD1kgxmTqSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672501; c=relaxed/simple;
	bh=yGRUq+NkeA2wCzaT3ddrS1lhHL4f/8v2x/N+ptJUPEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jP6iU/Tk8UtLKP+33itbUoTkD9+x5BcdADhMmHQxX/NsGpRO/mLS1VwuvfiaRyJUvHWWYdp4aPwjaYGtfJzc/VWdnISQadVAtC81oLvX1R6d1sxeeVJnoyvvShgBX4QX6bAqcKZlPr/j38V8R5Wty4lw351FZHq8oUFpCxQBS4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5d3dc9b7f45so29097e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 02:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672498; x=1791277298;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M48abSoMOPLnpPLpLH2wH9c2xeQ/JgdDngp0dUmsb3o=;
        b=p3nCAkByvupfVK/Tq9s3uyg/1Rqc2BWFwvmjNwXU+cTfVwJNuQuS5AbUS6jDyYmE2i
         VXIN3JJIB5uGiUcW/oF2DB2MNhVOcS0QgXyHA599UuE30z3UNrF+u+4HxYJCjEmN5KMf
         F3qlvK2gjcoN03d3zFEk3lre/5e26TjMboX/wlXEE0j2m3og7sji/JQYvtoCO5679eif
         8fjkryPGUdOHRWnRrtcCBm95Q3rIOg5J88PzglDZdXSFUfKDhK8tdFg5jyAl971DiFJV
         B/QioKu22QzDl19Lc8l14qx56Vl7Qxr9l1VvwLOw3jflf+5X4pIHObnKcgkl9XvSQ5ul
         EvhQ==
X-Forwarded-Encrypted: i=1; AKwUvBznCiYps69iQb3n4XtUS1wwDrqw5p+d+CLxZ4Hn025szKrqIRK2UfajX+RJUp/cp8CH3ljC43Cbda+z@vger.kernel.org
X-Gm-Message-State: AFq9FYIwp8dFceeu5GVS2H91tZyptOCyjgO8LxFkKHqiql1UDekIUe0V
	UcJu/6S7DpPg9zqho5HQCW5scmRi7yJCIeqoSIIZTEzk0xixJuKzG//Mjtc2TwmIPR0=
X-Gm-Gg: AYBFou0OoTZ/7g3yCeZ/rXzzp4BsN3zuJgqIP6NIcCT8hd9THcEz3+0YCt4FZmMWjkf
	hpKTyfeDoAz4srdTdwgJJs8zZgPBu47AfNq5tkSQefaLvS1jY/VZt444iuQcXTtgNTChDWH81lv
	zjWQ2zZt70gMBqE8EhkvlsJRTOcnEp2Xhr5pl6/iOR92qMVKe09g79SFiba0g3+InTjELQX/94I
	SS1VGRzwVwo2f5MvQoNA1h2nE/KMoukuJWBm4esftv5EXP1nZtlVDZlKUIIJatGVv2ND3Sy8CGJ
	DYkzJ6OFZYt+YdcVhDc/vL/27QGPGufwOWomi20eZ7l+AtcVQZABZ+Q2a4Y8MsptSiknI3R4eIM
	71HNtXMSTnNlH9qtQt/3xSrKXKxdfO53qpM1ZkSvr1TEJw7poRp2qBUuUjHAhpEdXPzedF57HPd
	850hkQlV1xNg6yqPlQiSTeA2zJ2H6Kl1UTQqa2kqyRmtUJDeFmz2/7c+bs9/Q2ymK43Z67KQ4Jo
	hCzNjQiQHFIjrnDqNPGQ2YI3SWXW16cNiJP/qBxSnxu63/m
X-Received: by 2002:a05:6102:570a:b0:7a6:96d6:f791 with SMTP id ada2fe7eead31-7af1d3af54emr4613691137.16.1790672497911;
        Tue, 29 Sep 2026 02:01:37 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b398ee9869sm12849540137.1.2026.09.29.02.01.36
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:01:37 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97ea1a712deso878115241.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 02:01:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVJ8jF+8Y/ZH2Bpqg8KH3XrhMf9wn86FCF5wrRYpV2ueilQg6IBjLdhhbjk2ykGt+FDDvwjJw3gEDw@vger.kernel.org
X-Received: by 2002:a05:6102:2d04:b0:7a6:accf:72c1 with SMTP id
 ada2fe7eead31-7af19740319mr5405907137.0.1790672496458; Tue, 29 Sep 2026
 02:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com> <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
In-Reply-To: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 11:01:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMURt52wR7kM3=7GKv7x-3O77MLwSuUDt7KJEf9e+hqg@mail.gmail.com>
X-Gm-Features: AclHuK98mw98nJ3_l_Mt7cVTGbvizjI_Q30Ugi6pttPN_xWKMIDQnQGX1HfBaig
Message-ID: <CAMuHMdUMURt52wR7kM3=7GKv7x-3O77MLwSuUDt7KJEf9e+hqg@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 10:12, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> > Add support for a variety of SolidRun RZ/G2 based SoMs and both
> > HummingBoard IIoT and HummingBoard Ripple Evaluation boards.
>
> Thanks, will queue in renesas-devel for v7.4.

Except for:

  - dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-/output-disable
    Already queued in renesas-pinctrl for v7.4

  - dt-bindings: usb: cypress,hx3: make peer-hub property optional

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
