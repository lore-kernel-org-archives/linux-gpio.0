Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795176796;
	b=Hr/hqFIq+9PjOFdoNBbHQ3M4PkqOvBw9qo1H5OMDn0Hxnzla0Ln4rEyNnMzbpTkViBO1
	 4Lwz4zg8bdirhP7fUVMmLTTSuaA/MWVLw7PESKEUAhyu/7Oboni42x/0sp47a9ZXvI+UC
	 t47Z019yZWTyyqKJyQxVsj1+5lrEXjn0ex0WtUyU4+IsXHym+bOWZd74iYvnTXmD/kIxN
	 TlC3K6nX8q6TPy3p2HuGrzu6qfglMFo0x8xsGaj1x8oNBduyGIz6HrfoWr7znqN+9bjtN
	 GhVwMxqmTA6u/Q/2651Xs+4UY5CpQ7RK4b/YKuZAi3sNBOiIp4fUcNfy+LGXoJV6ezw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
	b=4atGVjMORi8gJ/C/t6f7/RfJeqE4I3xx4xWgFTwpcGHov4KMeUGnqdp27qZC5z4zZ5oT
	 /Mw1KtDjpXADc9Wg/79iHZ/3qn+IcAqlbmJPlubNBeB+FwVRj+fF9L3QnviwoZVdLEEaG
	 baXL4babJatg8FKuZneiCsxwv4XnwifVKovLAOh5zgsZfaoU5sTOF/PsemaheqWxt8T7U
	 VTIQx0zFYKbbf46HrR4/zjqTREo87Yi5/LKiQnqwON/um1xj/n6tVE4Uoat21yimx9exu
	 U3yjIJsCZEtwWu3lnfTQhsngvd4S+jPZqgnt/pyMkYm52ynXlfZRZ7a7V7SDIgZ+jfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L2hKjcXw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0560606A326
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 12:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0560606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L2hKjcXw
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1a3374400so600672e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 04:13:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795176794; cv=none;
        d=google.com; s=arc-20260327;
        b=IhCn/npCuu/PhSrdD7xWEIdUaiMCAu7H0Kw0A6dwf87+mBLqrYrjLy+Xg/OH8J+ZYt
         LyOLuv75Wr1KmCwjSGt3QxZA+zIYGlvgkr7uQavOFpe3dRDDLV9i+k49sgUAOZb0MCkz
         N7MUwcJSW2Dy20SEveat7bJi7ObtL+36l/IQu2BjcGCSPYqw6x4A6ap8bcJpuuEoBApU
         wj7FOTplgXApyXbiTbeYQEb9XGkzhpOrKlCoBv64SrVItAnDMLtA/4R8CDiSM7kXIcPF
         AwCz4m7To5xgowUv6zfQyhsO+K7loOc+oY687ZxV5ZjbWIshu4921sbpsdMjTHtVisRz
         0BZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
        fh=UoWgYbYYuvjb35UHYr+MDH6rTTOtaJvM+DcO/vm1fPo=;
        b=quhrJCodu2JWZTf/LbjYaoUgXbTwedpRrbEtI9jYL1amELhybXF903FnnpuObqGavi
         iHpe4awx8Bk9SRNcIvGN0/VOizNyZModvXQu8+GUj8ORicsZXvGFTHofP8BTcRxWI8yl
         +a0oPQaVc8hkmP9TDd6tH6qoqQzS+2Vn6cgRbywZI3oUVbxiymXadqvey02nI+4is4yq
         4YM1o8d5LLrji2FvS4YHB67HnaBOgU4J4Lc/2JC4OnOVG3c23lrRGJIA0MS4Ia7T8sD0
         VLXU73tcLKmlWoHZlHQi1co7Nr7HZn8xp4jem2XBk3ayZq4gepPZg1/rILjZKkJq0oyM
         fZKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795176794; x=1795781594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
        b=L2hKjcXwbx3DvIS2POAqz9jYjZHZ5sTJ+nSQ8kHtcsPZNgcWWJCNYUnmiZKbq4gyE4
         H24B5ILw5MbSHky/FcU3owDeerrfpFVls7ytn+sunOwc9C88RKJbcmt0YpxGLP1M/TOd
         FbvZyQmPtDMas3hW0BuqMvzrD9b5pSa9frHVK7i3I35L/72wYSqBnAN/txFqLpWMFzqd
         eXSG3AVjv/BNal240Mhm9lTRZA0dJm2tRi8tWWZDunvYrZIcyMekWtvIUY9Ldn0htXht
         odJYHBMxXLmuArerilao6ir+hxE5nxihRok/zca+D401llOKNyKJuEe6K+3Xc48Iz2Kt
         nyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176794; x=1795781594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
        b=GkA/PYRYlBOEethEAuAkuvEc1HIoNHB+Wo3SDWOomG34WNID7/OkKuy9VG2XQkwiAx
         8fRxy1aViESdyyJ0ZwM96NwwHpO7SYOtAUW4eRMhoP3bNNT194cvwpv5Lln4x+03Tjit
         h2IA4Eda1V0g8qrdDqGoT02rseATu5NZZmYnERVRABO5Vg9u7pWDTvXGIRXaIoYmiR7u
         TX9F3CFsxaG6ppoVc/oYWOkDFS7ghWFN5b9ZsLE2uHFr13wTAin7H4ME8BDDLw1SRAPG
         sUnYKQvGhnAIBuHt926BfnLQJRcDkulPzcpbZQovGaMZPLsC1Iqau9t5TSsfn/GFH3iG
         72vg==
X-Forwarded-Encrypted: i=1; AL+hErF0UEkkJbtmWBq4B1WWdJMmCJb9I8uDY+gWfmmAk5kv+IuPpEHJnyaLPYVxLWcaYlOLWPCajfU2tWv1@vger.kernel.org
X-Gm-Message-State: APuU4Z9YznX0W/xHcY3ucUBz5Tjo3mD1pjzzRBWfz9sxg57WRsWTCLN5
	kvZUDZhkkgeqQ0Kxm0qzX9f8FeMvnxr+5dv0l27jUhZ6CemO0i81V53bw0fDyIaY5d7obz6EUdb
	vnot558wRtRXbGhQe5l9bKq5J4wommuU=
X-Gm-Gg: AZFdTZc+DmRQ58BtZ1Tck88h1iIecJjDMZskEROui7MQzvVYv8eNAuvo/Rul/DDMYoR
	9adF/Zx+EU/LhWnltZw32GDtDa6KU1Luic9bVGS6mGBo0tXywqrrOmrMxaJHfMQI/Mg9j50kyfU
	/BZGP2FJ7L7lCMo/0sHG151jzjGRqi8uXQwp/M+lvbUDKkbM4rgPBw3AJSAw0fXoHpFOuMS7DhT
	1mToxLijeSslTBJYOSDRmw263LUxtOJ+3+xalE2lcyeoOkdZdDDDHN6/rhA+55djCCqCEQ+ge9L
	/ijFvdzCe7jI19X0YXBJ2+LEWNLdWxtl1nu2oNA/y+YOokuMQEMCPxXMHN9ipGJbLZPH2v5yDex
	0Lru5PbXelLPBa/jEE8C3F3XcbJ8AiZFTMMMm0fWZ+TwLvxhQaRrC4Pr/1Xqh1iJDcybDyG6jDp
	VYTTBE0rJTHHKUmLkCilcIamzZ
X-Received: by 2002:a05:6512:a78d:10b0:5c1:46c8:4797 with SMTP id
 2adb3069b0e04-5c1bc7d1153mr604351e87.17.1795176793721; Fri, 20 Nov 2026
 04:13:13 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-b4-imx937-frdm-scmi-pinctrl-v2-1-911487a14300@oss.nxp.com>
In-Reply-To: <20261120-b4-imx937-frdm-scmi-pinctrl-v2-1-911487a14300@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Nov 2026 09:13:02 -0300
X-Gm-Features: AclHuK94xOx7RNiFqLMbC6LRL1dQuiXB8r985LNFD94WYgXQMJhVIsyDHnh7OLI
Message-ID: <CAOMZO5D4KV_v7w5tcLn44UsMxpOFDQwr48b24Mx1Fy+v_J-WFQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: imx: Use of_device_id match table for per-SoC data
To: joy.zou@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:46=E2=80=AFAM <joy.zou@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the hardcoded of_machine_is_compatible() if-else chain and the
> static string allowlist with a proper of_device_id match table carrying
> per-SoC data via the .data field.
>
> This eliminates the static local variable anti-pattern for daisy_off
> (lazy-initialized, shared across instances) and adopts the idiomatic
> kernel of_machine_get_match_data() APIs.
>
> A new pinctrl_scmi_imx_data struct captures the daisy register offset
> for future extensibility when new SoCs may not use register-offset based
> daisy configuration.
>
> No functional changes.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
