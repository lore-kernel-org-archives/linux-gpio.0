Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840079;
	b=HNqDnLuWIt1o1T+wpU5DPIDtnLSaNp4vwOBaERlcMe5PCt24ad9dShUoMS8uq3wWkAIy
	 SxUv1B153X0LQZclWk6IXO+AkfUnu242AYo8VnnH4LetY1imaMKQlKYI0U5VNIq/JgAbG
	 1nHvOKstVjVBzB0TP5gB2i/SdG2RajyUW8DWgZqHe94qx19OSGymEy9bnHxSrs1KDxLXT
	 Y+6ckBKnF1i/AybRDeYptqUKW7otqmlV3DaTUiml2HPgeIQJWR3PYR/e0ZRYg8s9KPIlf
	 DH8MES7tp/hdAO8N3hwmfGPIemNuU7H8ySCgVVZlA5VP6wNiFCFsiJvWYg6F5/vfSXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840079;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=rQ+p97tJCO0QpCOaOSbeRKfH3OuUlnjbT3rJGvag/9I=;
	b=MP3ZS9eFlGHUhUKJT2LL6Im82F0lCxiY6XuSkmv+j0/jkPIB3YHo9zC8P3QHweBiG8T/
	 Wr+5ptMncJvgj46GhlQrJCgBi54/d9QyLAtNUXa+3j1+Br8Sp5j3tHw8FKx493rQdFuPe
	 5qo8AH4hwHczEvO/awiQ7tOVHmm7hN1VKDnFhZa0oU2p+EMVLmP6BmM308z2QdUnZSxvB
	 K8oA2a3wg61Qw/J7pJy/xJRMzLU/dj50moBKLTnscoznYlGqigRU6VY63bckzBR3uX1lY
	 G/Pu6PbVyvnQPCKgbS4MexvSqHs8N6mzL4kAw0smakSnJx/Xfly/IV7oDQtwL4F6gmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663FE606D806
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 00:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 663FE606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5378b281aso8403215ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 16:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793840079; x=1794444879;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rQ+p97tJCO0QpCOaOSbeRKfH3OuUlnjbT3rJGvag/9I=;
        b=WGEAqi8MLQdSMja+LOnjZ5+CkviaiLZTSmpKMSG6DusVe2dnQE9shpjcqKf66iAEZP
         SR7m9HxchCa24XWbaAICzThqDuZ4g40kaTN0vRO6Tw1QPw/1GszVnPyNu2lqotWMJ2oW
         pXzJeaHH7oQ+qb33kN5gYTg26JkdPD/L9Uc63ertqrU60o/oqVGC5VxvSSPUHmYb0L0Z
         ZxX4N3pgb3RFf+MJsVnV3nFsGNY2poUclR+XWQ0zo7SviIvWpeYYNCxXNEPIsdyb57z8
         dW1XbIkyh/e62uQP0N1e0GdZISwVt4HQTiWcjJT6kOE0iPuO39QOfbvk8mFbuKVthDU6
         wO9A==
X-Forwarded-Encrypted: i=1; AKwUvBxjfKXOZNLcvza6i9ZIT6gopoTDTuFNmwrQMvP0kp+osrATU6+qR9byeZdb+b8WPCaffWGrxp5KG3l2@vger.kernel.org
X-Gm-Message-State: APuU4Z/zNhQyL8Eq4P0D9YYTOKQ2kr5P7T2tpUJx9p0MxhnLXFWuGI5c
	YAcj4SlH/UhyRnDqaDO3Hb11ylyzGyBocvJUH5nL4Jf6h2h/KWsamLD1MXNAChJm
X-Gm-Gg: AYBFou2zJGPG2H7LKwPrJUfAkwB0fqa26yzXwzyDV08CzVcAwPwlBrlJUFrMAyBp1xX
	L4yJsW1dEazslrJj5pAFwmLi5Pvn40PsFphA6sYYyhY/iVWhj2P3zXMTpGqd6b4HwOhuaS+L4/S
	8abhx6QK4kT87X7ENsIwe9Ey7GDQv9ehHFSbIL5lkHlDMjzBEZxNl8LMwAuQAr16iWwMcRrS9NQ
	cNmCSbeVOew3t5meE3BrTc6TKFa8hIuzIVuE21qUbp8SIqFqAOLbooK4P4S0bxEbpooR8yCnzz7
	ZwDb1SLJZEAE6M4wEgvg1XJUZKHAEU9cJsmEdKEzW8XxwKA59cXYX3k1h3dZCv0xzUWJjpSKLgr
	asOTssT7Z2W1gCuqbVhCqVEofA1iibxdn0qqmuqds1YZCpvv0dolvUTObDGhW3p89IUazCz3ICL
	Ur+yEGq8bWaLy9bB2MwBF0bOboz0rvm0api8OWW+H2abHQx8RICjpCan7PKrqJ6SzFlbVQzfNKb
	3M9KQV/yKC+fyrdhWdsZlqHXUxeUhXXjdS5tjK+EfX7OW78QzkJFrBsIj/5GqWOaRpMXD+AYl0D
	GPQWisfPha64nEEbllRTTQrIScJffs7V6m2AUTsNI04PieRM52HGRsJjVI3Rt+JPEXoxxBAEPfj
	sR8WHmWjEh/Q1cUh2xocEeC1g1KCw8osFo2cT/fRNUm4=
X-Received: by 2002:a17:90b:2246:b0:3a4:b8dd:1447 with SMTP id 98e67ed59e1d1-3ae8974bf64mr15633203a91.34.1793840078680;
        Wed, 04 Nov 2026 16:54:38 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3280378sm995294a91.12.2026.11.04.16.54.37
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:54:37 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36dbde64409so801386eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 16:54:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxLv+adlLL10kqtBGvnKjkSk7eNE0d4v0lDk1rLhSzY1/Bq2LvzkiX6PhmiTzNj0ySLYw/K1DwZRFgT@vger.kernel.org
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id
 5a478bee46e88-36a42437876mr26853707eec.34.1793840077202; Wed, 04 Nov 2026
 16:54:37 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev> <20261104-geiger-handler-f6688647819c@spud>
In-Reply-To: <20261104-geiger-handler-f6688647819c@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:54:25 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5pBrypa1PKaKRPxb9uvaJBor+FzUXY0+gxLHOUy7W-Ow@mail.gmail.com>
X-Gm-Features: AclHuK-Z6NSKmUV0ZPuPw18jk94Az1xuvLsjfOJ7Ac2Y0GWV6yFDmJA_PUWlBBE
Message-ID: <CAPY4CJ5pBrypa1PKaKRPxb9uvaJBor+FzUXY0+gxLHOUy7W-Ow@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can you just use pinctrl_generic_pins_function_dt_node_to_map here and
> dynamically create the groups at runtime (and also make use of the
> generic get_groups_* implementations)?

Yes, I'll switch to them in v2. One consequence first: the helper reads
"pins" as pin numbers, so the binding's pins would change from names
like "UART_TX" to numbers, as in microchip,mpfs-pinctrl-mssio. The
function names stay as they are. Is that change fine with you?
