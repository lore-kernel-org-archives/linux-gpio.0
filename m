Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECEF3A0E93
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 07:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346840; cv=pass; b=Sq+YSIYQZcfdo+fo2OxGZ31ndLTM6kR9wVrtphfP6SWtmrNU/Nlq2ia7lj1EaVK7lvZFg9RAL7Ks2w43upOHifButE1IKomzu6IqWWLkkNKUEUt4yOi9dpYXE9mt1vpElAc7x54ulxzUaTpn+v8RCjKxYrdd+9iMi37DXuT8aYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346840; c=relaxed/simple;
	bh=+DtkcWXpgSVoe05+cxu51zHZ9Mzah1+nKac2Hu8aixI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kg0jBZXnERaqXJNGZDZxrfCFVuAMJkyQz9I/Vlj4VRUU0zCgUygD4MifvHJ/pcaBoWuDvT4BqWPwPx/IuINpUzGMvfQLZUhfRQmsbUaRDqSmv1aal7pVYSl7NeCjnoWvUCDA69t3mT/q2+6TY3UamZgNMUMQK5+5rV+brFkJx4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjfczn5/; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjfczn5/"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51bfad59921so9144131cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 00:27:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786346838; cv=none;
        d=google.com; s=arc-20260327;
        b=hcPH+b4/COcSmty+oXozkEYEDGQ/1IdZiLFMohsv3EeZ/Fqm+zJTLzgUzZZw76Rppv
         pqJ9n1myzSFaHhGeg/TpmuJ5SlPrbBZqAmwW0F0Yv1MKr8+0BED9p2xmFxrCFqFBqANk
         Pd3+kBwVwnR48BNsvbWzFjlu4SjJm6PwE5mmIyvwXWJKEGMi/wuE/Bih12wCX/tCjeDi
         saIZEhIN8/VuNQA79yUGv10zeQ7bX+kTUCXa5SfblP2zYhCqN0fkLRw+BKC0jhbtiULc
         aqH2RjDroAx4L8EseLdmXL5xiri5NEP5C3YHH7UxtVpnPBBOOgmUDDSER8Houm69bYsW
         U+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+DtkcWXpgSVoe05+cxu51zHZ9Mzah1+nKac2Hu8aixI=;
        fh=WFOkGTCxY3hJBCEEk1DNmukT4hr/3q9kNBZjxeT/2hw=;
        b=X4KWawCW//fhwawHB85oWNUjaqrTa2JiXr2Y9/ZRIdKOAcgtEgooM5gr1PdvVmDUyO
         1Rmm/Du3moM3wcRed29M5h9+RAnCX1Z4F1rsxi2oG1hU7vaXmA/zJ9uElmrpDRutqELN
         AQJEVx0YPQENPjXftWKDbL/wN3Dawqocjn4p23GJ/ixq7xdzQ04OB1gRv2fdWyqzUPfq
         VfQv2oypN2lXGwPM446ajnQC9zIg0PnlVz3Rf+ghgEvt37/JkRyQhfQPxJEz9jRNA9vp
         wVthVgUJH567iGbrnuCUZqrKpj0ySIoMfhkmuTViUCDEFA/gjdTLpqQ8UDpZQ7pK0OBm
         gltA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786346838; x=1786951638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+DtkcWXpgSVoe05+cxu51zHZ9Mzah1+nKac2Hu8aixI=;
        b=fjfczn5/m3A9OTGOrEoQNFczrr3KaaLT4YBaQUDmrOylTOObyoch9+VHPD8I4Rab6x
         Z9IlJ8sfYXoF8a1qbkZThAfApSj2mUSRGJr2T5Ydrh/njP8m2tj+B2aT0JlvPAZwCOEm
         xSxH96g+oBwIOzMzlujcPzhRzIWKga4TFloDkgwMnZbX3gYznELVdSRIdVH0hyaPAt7a
         MPgl6aUmqY8HX2ysJ/P8LmC+ChDAJhccLlt0wepFgEV8K6726l0jRzGZJGkgCLeQReI8
         fr+QNxo7/NiLmtK+cwGlZRJYHQnPUwF0J0H8Znwbhl4p1IG32rIiRjqlbQdJSF/2DSFy
         aIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786346838; x=1786951638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+DtkcWXpgSVoe05+cxu51zHZ9Mzah1+nKac2Hu8aixI=;
        b=R8QTe/LA1mtLXo2OMo8tpuUBKVzzJisNFQqFRnfhNIZjAEYFEPTYYqLZkaMRmR+M1W
         e0Ra7yMKW4LMXF0wamDgzK+9TgS9b9+Ap8dN9p+jirLsXRAJ/9C80UoGXumoL81bVC+i
         vok+LJyc7eXnSg/QJ10o6532K/sqwgirKq/3pmzxCFZjTNa2RRDJnG58+37bBUcUsuEu
         h53UMaV+6uGfyyiIHNW5KWPKsBT++QAe2fBXyw+9Ixu9NiOk/QKzpAO4lOPTees/Ae9t
         iOECgs7vXFC08XqDoN5Xh5jkvWgrU997SaF3k1PRqL2JWxmgrLHj9ND7mT56IC5RUaaa
         x3WA==
X-Forwarded-Encrypted: i=1; AHgh+RqAJ0+uFHG9Ec5vLHRxJT5YmQfeGwe9PtF6LkftQPOlia+oMY2v/Ez/U359jXjtLs+A0AjitgIXVobI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf3hmyF7yK/ZtlVHD0Clq2Axj51/rZeE/Q1szfRQ4QkGhBPZ7B
	uZtCZxM7OoaWu6piSFWCYfkbooDqaiK4cSIprnenyGRrfrod4sCyFoSMEPfR97e7L/f9ZE3UCHE
	5yGXr5bED07fN5d7S4dYEIYpuysF2Axg=
X-Gm-Gg: AR+sD135R3KxUe3xhztfse+aNVopZVn89WuJ3Uj7H1Q23rECGBR3DbofW73G9bNqbQR
	JB/0yZVTAFOGSETcC//94k59KISrJcjCu1QcUM7Ku/DhvPxUicrv1I9AFXPEPO22nb4d0Q+//46
	1W6uSvi+J41yIrQIiq/FC6pL6WLkT0OmqR+kuZcQKKDsVl62E0IStxeKYywkyghZcSzy7kllxDH
	srPOCBZYdEspSge40AtpYq/0Dch4boaCYZFostBj/MtmlshBs5EIaxZD3dlWCNfhE5pp0viugIx
	RVXbPgAvHcjhdU2uHDK8ESKbQ1N3cCdYqgXlOuF6/w==
X-Received: by 2002:a05:622a:2b4e:b0:51c:17cd:1fd4 with SMTP id
 d75a77b69052e-52ce622aad1mr426354311cf.41.1786346837843; Mon, 10 Aug 2026
 00:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786262697.git.naseefkm@gmail.com> <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
In-Reply-To: <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 10 Aug 2026 09:27:04 +0200
X-Gm-Features: AUfX_mxJ04kaXTJmP1OVrdQLPid7YkYxdoDRvjl11jvmxSghogHNPP37XYst2dw
Message-ID: <CA+_ehUwO0WEiDGE18a=v=ZjJhpZB_KVP=m-Cog7K9Cm-zZV6EQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
To: Linus Walleij <linusw@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno lun 10 ago 2026 alle ore 09:23 Linus Walleij
<linusw@kernel.org> ha scritto:
>
> Hi Ahmed,
>
> thanks for your patches!
>
> On Sun, Aug 9, 2026 at 10:05=E2=80=AFAM Ahmed Naseef <naseefkm@gmail.com>=
 wrote:
>
> > The series is based on linux-pinctrl/for-next, as it depends on the
> > per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
> > phandle that landed there.
>
> If we can get a speedy review on these patches I don't mind merging
> them for v7.3 already, it's nice to get some movement on all the
> nice Airoha silicon.
>

Hi Linus,

I wonder if the same speed treatment can be done also for the clock driver =
and
also dts?
There are a few patch there that are currently blocking usb phy and pcie...
