Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795030266;
	b=jzf+BJguV+x0S+yu9QhD3L6Nipf7EKoTmHm+MCz2dQUtlIFZazSZfbY59E7zkZHSMYX7
	 Nyo3UCiV3pZohovIfAtpnKKi0TB24XtUMFA668cWm6Q9XfqYJE6NJb842V6mD0UoQ2GWo
	 Zpbsj5lnpxewd3S4YNBGbMZKcZ0NwGDETls6D2DhcFIs4r6E6RZ/vlYdWGL1jAYWgGBw+
	 3XvKE+TzgLnsz1hv1tBrMAQVk/EsASNPwdH+zih8Ns7kucP7CtM/V5YT3L9y13SlOnx0+
	 PuBM/XKczQw36D04oKZGOMFZL56gBJpu+xR+2PMe/emQKiloCOP+ou7bTR5VBs3xnbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
	b=0QqhfLhYwdA1msbeLeh8UKClrYIpdTCs9R5btClcMgFXTbn/SP/q62HBqeeJyYEWP5mo
	 X6ZnbBoPJ5G3VZ5BmbnNTpzyDPtafLHA+Op+fDjnfWyat2bNBSj5SYLbmlvrO4I6wd24q
	 AVbEBc14dg9AIThqb3o+TEzJy5/R7jVGulK5+7lm8w3K2KcJvOAw8ToWRko3Ibo5elJZp
	 PzaVUOQT3jarHKZFz6vkFRG6QQdw1Ozs2twJTsWNvg8M4qoayjVjCq54uOpC9xpyBWO+r
	 8cvT3Q+sg8SxqSnIvWoHNWfRK+d7geM5Fis8RClkFhQ8IKwwW9GzViQ4tXVmKxzL8fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYTxxlax;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD45B606F539
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 19:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD45B606F539
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYTxxlax
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c511cdd5a82so115807266b.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 11:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795030264; cv=none;
        d=google.com; s=arc-20260327;
        b=Y+inGvikljP93JnjrjF/a/Vd+W2Ohq17Hdx+c7gLSlLYqi6EEFytCd+fDcRLxmWrv3
         x/KxjR5WHvgLE1a54ivaPwUQKiZBfWMqCdM9UitcWqoF0Uelq//PbkuZZCIpkX51G7lJ
         XwSQJO1ApkMs7VZU0eZXvmSK/6IUJEybWQe04ishdqhA5mcrxqHwqZRV1fmsYFgNyAAi
         p9umkJ6XQhVBdYXmTR1qGylZV6R4rYDoiegdsCr7RxqFmlqusXToi4GAvBkQ7rEQslG9
         Co3im5huATHhHEsVnCyhZ4tIH4fiBTDD/SQdt7AmN6VX/9rY1Pr8ounz4VR5hsIFKj0B
         pwJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        fh=onp+vS7eLiwreAOOAeEqmsJmQbsuBtGWZh9ST4pYzHM=;
        b=MhcUoNvH44D7rM2e/YBQenoH04kU67QpcNksQTdr6zyBcHASCwPzQBAkgAUmphcvdR
         cSjnyDyUTK8or9Smg0iiQ8iP2r/NK7Hm1z0iUQ31MQTC73K9riHDz8HZEFSzSbS33ZoL
         gcrNMnnEwLIlEnWYHjWnLx+fYgzClBNIbv7YnHHuth4G7Zuxovb7BmQJ39/gIgCfKZTF
         dOXDXsJQay8YQBr/H227SHPVzLh7EE9Ev7GNyvYsoKEBF0d9oY3+2N/jbnQ3YZIuYYgw
         EfKwg4tBb//NosptOpRfBR0BHCRIE4YVQP+FrSbk+qQ9+eywcrT1jLfeOuMlXArv33hT
         VLEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795030264; x=1795635064; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        b=YYTxxlaxQ2WfhHso/oEI2r56Wf/FngEvX4IGgjBf48e9sct9kQaN5+W9clSYP5LlZW
         9lGoVnhGTEg9+TUbmq/jjF0sC+rmU+Buy7VOy6sH/tPxGdqjjnXGgl2MbLOCk/+k9Rho
         IZJxpHNo6bOT5jZstLoYdAJHZylRxqvtOwCldTOD8whfdnvEhqKJXAdU83+/L7lRIx9v
         fzcCiYcUTwNu01GC9OfJiH6YaqiVEysh0kMaSWmSU8YUIYlmG2BvarbXEefoJFvoMsw5
         PH5l2eEIFL9NtYcZ9lHXeSizazga9SFSOqqZtZ+ipAiyUSM6RiF73meQ1GDoIrwk7+Wd
         OScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030264; x=1795635064;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        b=HnJ8xJ7tTVAdcDKmxrxJRLIbTB+hiYWZ4M+Jmb2S+pjJolEPNkiXG6anOcjhZUe6jr
         oliy0saruU4rrBFsX6rAIkjXg3RA2MMPmnucnjA9DDcUqLbWKNCeJ1yHCqor46cuwAIq
         470Q8bFwY8u1HUlxN32PLzWkN1oqXxHDVyqn4R5R3o0DuSCsMKH041ojLyk28M1/MAwb
         ar/jkgtJP+2vxn8qVzhzrpst2ABEQeJRZK/UfxVu422zwywTNQfZPhj09R9BGdZ4ohQJ
         07AsJ8Na8erI/CIGnIsu6/zWuLnEMhMJSY6+PfQvU/DRgfdjghQTdD4sNmyFT8sW7GsQ
         OrCg==
X-Forwarded-Encrypted: i=1; AL+hErFrdteMpaii6i6K82L1dCAA7uxvSI4tE3GRuGQu3Xx8KThomhbdmzDbgMeR91XCcygiWFJmhEhyG4Ps@vger.kernel.org
X-Gm-Message-State: APuU4Z8LE4M4PMn9n5ptGdraZLQRjDdpOax5GA4+ZbhvvgmshRX9k5Pa
	yLap3K1UQO1LU2iyMvPrtS+/V91mRX3ziTYAf4OOdw7UJ7e1mWO5XXmERWnS+30L1vdDGAGMEMb
	HsEy761Pmi8jfabEp6g2anSTCK0j9yMw=
X-Gm-Gg: AYBFou2xtLvSFqJceMNI/16bAUdZPo4ELnHWkj2jq4rPJchAi7Y/hWcvq+p1QguWzUy
	xyanuAK86NcM5y7wW0qxTVkEB8rzyg52Nu4B+/0Ixyec2IvUuC2zTb3SgInBg2SOSLl2KOxMgJE
	z4YKqu7ggCtdVN87szv3yXAJuVrFGh6yDMLn64OwYJiNldgJQ9OOeCVxu+quADyD7EFE0vd4NGk
	Oor2yXHClMhuNRU3i/tKVW9ZNMIjVHfh+cvSJbhg2JmiIds+tjdsPqdvnGTRi6KJB6EivKp+Gpa
	vIXyMGEN9LIrks1TLPT9WG3D3/LyTGxZNj4vyTW27SnzQb8mjrc30ExjVOIFcnkLLTeoDL+LoAI
	7QudbJces96Q7lHyzJpzjTsDLvozTxu5/SEs=
X-Received: by 2002:a17:907:f816:b0:c2e:317e:d711 with SMTP id
 a640c23a62f3a-c510e398889mr303013866b.27.1795030263845; Wed, 18 Nov 2026
 11:31:03 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105194426.1113050-1-l.scorcia@gmail.com> <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 18 Nov 2026 20:30:52 +0100
X-Gm-Features: AclHuK-Q_ZR_eSDZWgs8r4i-RTkFZUMV5FI3ZV4LgWAQGQjLtUrjcLbEIObtllI
Message-ID: <CAORyz2+7q3BTeW3NsaiwN9riAbHV0Q_tCm6bBV7RoiDeAbcLrg@mail.gmail.com>
Subject: Re: [PATCH v12 0/8] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> MFD looks okay now.  How many more Acks do you need?
Still need the regulator Ack. Mark Brown provided an Ack for the first
version (almost a year ago) of the regulator patch [1], but it was
substantially modified in later revisions so I dropped that Ack.
I'll move Mark Brown from Cc to To tag in this email for a gentle
ping, I hope that's not against the ML etiquette.

> NB: This patch-set looks split in two in my inbox?
Now that you mention it, I see the split too. Weird, I sent it using
git send-email as always. I can resend it if it's an issue.

Thank you

[1] https://lore.kernel.org/linux-mediatek/20261105195206.3440-5-l.scorcia@gmail.com/

--
Luca Leonardo Scorcia
l.scorcia@gmail.com
