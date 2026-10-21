Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598610;
	b=h60wHXKqxl8uB6dEyrq3Ztj12IrEV9oR13jcN9cyFMt8Q2ARHoigpmhKGs5DFv2hrtUC
	 LQQK6LQpih44nUdKEPLE2EoCgvnET7UzghLV5WxrnWHQ6lBchP7LP3l0TnlnZSn1CM7zq
	 ul/raLB8/kdy9qCNRHEKq/demjUj/ZDd4wkCXsgtpwzv3b/EtWhu7raYwbJ+tErxKifjj
	 DMza/ITxplukcebPMjQgGzj2UgLVaU8oFSoGJmQ7oIuApN6l7VGYlxZRG3sFPYWc7qTnO
	 kX/q7XUyHOeis3boMWGAJO7j5E7W/DtVhFu6lc1nR/3uGrxvuwcEvydY9BfuhODcHHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=o+0U5uc8o8aSpg/3Nq2d92vcnnoDIvQVEgNyLz/yOhM=;
	b=5M34GdxhV1h9jVJBlLgVOesApuleUk4NXLyB4+cPJgI/EFvLCNOj6HQtBbjMWpo9xLst
	 UUOC6XA25RmwEkoZxCBMsX99QC8t6vX5Sn0mgn98qZiVymsmymMz9UseBtBjeFGqo7PMq
	 JrNVSUBeZm3CUSeD4jEtew6wSPGhz3cwUj2V9EHxQUx6Fdm/dzsLkxhRC2SpCMnY5Epyn
	 mXwAocU4QsAE1jifpP8C7J6aeKkhP+81/H5GB/oI6227TBFe8KKaUaomDfUlJ0+Fad9qR
	 OyitaUIfM3k8vmF+xMpijw8xwANw9n92UHv5ypE7WfTzEnoh/+bLH+bW/1DWDT4+2HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DcqAC+4l;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EF7606A31D
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 16:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8EF7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DcqAC+4l
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so6904325e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792598608; x=1793203408; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o+0U5uc8o8aSpg/3Nq2d92vcnnoDIvQVEgNyLz/yOhM=;
        b=DcqAC+4lxwBFlm5YG40AObp7maD5+RcbCG/BK551aVKRE/vLWjhW2F1sKYXZWsDRCW
         DZDcXkTNignIOC3nfP1MeQnUCX2WALCdlfzd50ls6kb8+NkpctoXtUa4e8LTBR32dRLi
         goimjXS4P5V7AfJGbVQ5pQgADGtzAgTGMQb7jkpQ0lBbnXgCQxJj0S3IhsICxBPHdMN6
         fPHcyNl3ZexRll68Q/3DXdbRuvAAsuld5tCfWh72WIS+3BinkfCqmlvnG5HtitLlZBf6
         LszrSk76jit9xAQtfcd8yfuk6ba52DLLOar11V1Jl0qYI1Ai8rbE5mVgMz3xFvu+k/X0
         Obsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598608; x=1793203408;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+0U5uc8o8aSpg/3Nq2d92vcnnoDIvQVEgNyLz/yOhM=;
        b=iOlzABlyTaxOwa2GKWfmU64vhmjTouFer4dfQvHOVj5XCx5zT1zksRW2wXcs8pfUFg
         OxgjzcV3hKeze8cALgqlUBf4JsbU8ThEk8CCsTHuCDJj4rR1pEBdIsMrLnZFJXwmbrmo
         VxUuDYJmhoupDc4r8EGuw0uh2X9iVQWaD5J+VPxXWK1iOOXiRBWLVFQn5W3fgWMpWByH
         KY3dSJ/M7pvJEvf4pA43dGFK069yjLmLWceFlWBLjdlhhtoS8wi6nEb/kgxU2qB8VaU2
         0HCtQ8NmGyU8xFrdTZNJSXxDaSAY2Gp4kBdiwUGLqw3sfbA42qd5iXSjTYF2uHCN08/0
         RSYw==
X-Forwarded-Encrypted: i=1; AKwUvBxLO9GYn7FTmv/Jli0KsG/vgQiktjP9oSzG1GoljKn3wC/z8xLfWcM54B3Ieco33m+7T5m/vNNcRbLY@vger.kernel.org
X-Gm-Message-State: AFq9FYL8rxW5l/IhUCqn2w1oeDyQykNNWHCtSqiSgdaXPeFph4LVP4oQ
	YgZIO+QTqmykkycnVMEapAYeAAtsElyxkV6M6Q9AuilmuJM/szfaXCajSqYggYh2TTM=
X-Gm-Gg: AYBFou2k0Mf+csbUo/aiz8B0yjMBx8KFyI81ByWYl3NJTPUO2wzMGDKGgeYn36Wmlwe
	MluulqQwhAUt8n+IdePCr6Z0Q6Md+PZdsir8T/4WUcwpWY5wyvF3Rgb/mhfNgISyqxRmDEImxS7
	eaGFHvK6/3lw+86p4FAsfZ2dtRoYouOA0r3uokimP6oksidorhOqfGikjt55EwjO9NASucXfNpe
	XiqsELKE6ghOE5SDZCBd0YkYAUrrjCG/hP7vRDiCckU4qGDqY4Qn/VfWfgR/kn3CVsPxgRerqrj
	ByhETbagBwfD5N3zX4GNbHNVNIrAQOtpudBE0DRMiyu9RvGDB3rlF1Mx/RE9lhIJ4xzRgXlSur0
	Wk7fWPFsM+0ZYswl1aiVSgTDJJlhk0ye1wwkexnkSJHDaLn6E3wPw+DntFNeLGzbBM8JIq52n8v
	ZV+GFoY+f7ExNqoD6OuomCJrdcP+wd7ikpYVlBpeca/vRWr5SuIzn/w8mwNKrgUZxqMK+tI+DDa
	cRyage+FOHMhDihvHVuCqDPlJDkuOteXqfScAAq0dDW1DS3FafCs9y3U46ZXeQ5jNjJtGNHJUIr
	gKpL46AtgE3A20oMynBSqhDMGyf5ulLzzyeQr1+YaYqKQlI=
X-Received: by 2002:a05:600c:4fc8:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a1fdd2472emr58485645e9.11.1792598606167;
        Wed, 21 Oct 2026 09:03:26 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm53982045e9.5.2026.10.21.09.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:03:25 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 18:03:23 +0200
Message-Id: <DMAN65SWMXQ0.125AVDDDSIG7@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Paul Walmsley"
 <paul@pwsan.com>, "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Christopher Obbard"
 <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Linus Walleij" <linusw@kernel.org>, "Rouven
 Czerwinski" <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
 <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
 <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
 <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
 <DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
 <20261020215143.7dd0ad5d@kemnade.info>
In-Reply-To: <20261020215143.7dd0ad5d@kemnade.info>

Hi Andreas,

On Tue Oct 20, 2026 at 9:51 PM CEST, Andreas Kemnade wrote:
> [...]
>> Sorry, does dm814x.h not look as bindings? I'm a bit confused.
>
> probably also not the ideal placement in bindings.
>
>> FWIW, dm8148-evm.dts is not including the header, dm814x.dtsi is.
>> Following=20
>>=20
>> Basically PULL_ENA define in omap.h is wrong for DM8168 SoCs.=20
>>=20
>> For a better solution, you would prefer:
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in dm816x.h
>> - Replace defines in dm8168-evm.dts
>> - Add the header in dm8168-evm.dts
>>=20
>> or:
>>=20
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in omap.h
>> - Replace defines in dm8168-evm.dts
>>=20
> Hmm, there is dm8168-evm.dts which uses PULL_UP / PULL_ENA
> in nandflash-pins. Do they factor in this inversion? Do you have that boa=
rd
> by chance? We probably need to take the brush there anyways.

Andrew has one, AFAIK he already tested that, it should be fine.
We are checking the schematics anyway to be *extra* sure, but the board
boots and all the peripherals seem to work.

>
> If I had my head in some OMAP3/4/5 dts files with non-prefixed
> defines, I would probably not object against any PULL_ENA without
> DM816X_ in front of it if I am not very awake.
>
> So better do the undef and not use DM816X_ prefixes there.
> Maybe rename that file to dm816x-pinctrl.h. That is a bit
> inconsistent with the other omap files but at least that inconsistency
> can be catched by the compiler.
> Other arm32 platforms have things like e.g. nxp/imx/imx6sll-pinfunc.h

Ok, it is a nice idea, I'll refactor in dts/omap/ti, using the same
pattern as dm814x.h.

>
> Regards,
> Andreas

Thanks,
Ettore

