Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503627;
	b=VCSV63exkiShYhK4/bEEhuCNINf4zqzeHcxyAozAgBJwV4BaKa/WUHiNIz5d3wKfQ50A
	 4D2ywAWOCLbkiOOghHCT0DPqm3W6gSlbnC3It/1v2o/7MiLTXY3OX/ZIjy5T268GeiM9J
	 vmWw5GR9mDZj6x8c6f/1REYrEe+pM5WJaJtROOgvsdhBJ1IcPqh/VyHHIeumq9VC/Uvon
	 JNP5DmiL5rL0vzA3BfcZa1K19N4naU5BXIIty7TS92f/jpraTsuSIfLCeAKIXG32kFB04
	 WNA5KiIZWU5QfrzsPROzTw1yE4zNnHSx2XHkj+bpNfOm6jUL7gSDzp068DF0BLR56yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
	b=rvHcYmjIVwCEl7/YIrMAqXzO54bBIF3RfakiKsQEY4YWKFIPvabjtUrT9D/GsaRuowGW
	 31ymojeh00bfVsN6WCFZO21SmRyGzubGiuI7TtA+Na9uSWt2h8nvaURhBhcrBkLD2ViWx
	 z5kGucbYpAdSxUDxj/48qp3fznELBva1Npn4DS/YKnE8/htomGq/OAAAg/8nqz+6ga3oj
	 wmrkiNiGEExAHQemBgCeHAeQetlCUuBgGGYUtMuSVTzJPsfOBWIdvHT8ZLf0OFmp8R4jt
	 2j4AoBhxU/HruIpxkplypmTGGb0HQim3VzL4Y2u1hbMjK2BluBcE6mKI6ML/6nQi+DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gkbg+gCr;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C34606A32A
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 07:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C34606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gkbg+gCr
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso2639949e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 23:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503626; x=1796108426; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
        b=Gkbg+gCrbNN3WNgHhi0uF+8i2d7zwOXPgd9yVLZvjD7rxu9P5JeYcbwXcMSyngmxED
         piEUN9osN5BF/fOSx9HZvpLP2t+3P6z7s1p2UXXbrBC0sYY3Ee73LIgXzpOwlPZhgu2V
         6WAqcUqZH0VFmHW81tjVS7UIoCmSXkjpRznEDcbRECjyvVf0DcU3cohcGQuT53Z3D8HC
         iPUS33qsaKBSDlvZ58/yAqUFs/8KJuvkGUZLceRrOCBS+5VM4kTqpv7wJrNUHxljW+9Z
         rGPuHfTNZj124G/RtcA1Unk59fijky3CIzK0AmF2ngpVc6nGAvcolqzzX7edVnmiIbtN
         WBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503626; x=1796108426;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
        b=Q6wSUFc2GtFK55j/Mgeyhcnx0q+up4WysWnADWC5t6alWw5xmbXoPueU8v3C5XijAj
         owOLJNVvdRfnxsPeo6hvoixPuhcjfAjwV0fIO1Lbo7zxMrhd+8N6NZnXhwGS5uKDFT5m
         SOfT/1PCGeT9/FCnMBfjHeCIGxjU5b2uZ8zlyH94gN2zDwVbO61AKcus4Sc5WVmThS17
         cS/hekvNrp+QQXSGLQLIVwb5wRRsw8rwgdVRWN6RIlY9pAae68xdjFFNeedDTzqzakPS
         Sm4j76FRa2sh6YE47bbXYa/shYcD0wSmaLJdTLb5GsE6JQF0F6X7gE9YVkFPWITTrJue
         fvFw==
X-Forwarded-Encrypted: i=1; AL+hErHmsl4wjUUOeRKd9c/+ibFinaakHFVyKLT2NyN2XWruITNRNCEgLS1NaR9oU04otHy/YkD1whVfmZwr@vger.kernel.org
X-Gm-Message-State: APuU4Z/0xYcaDZTAEqYAMTLUAt8VOFfW/Cp0lHLwNSokaknJLERHq3/n
	GllFCRj89Qm0HJlD+g08W4TLSbLi6PePdhX3SlXM38KQQV5kDIODPzV6
X-Gm-Gg: AZFdTZfZRgEiV46xYqsOVvZqx53XYb7XqVnwdzhDUBUFaVL0ko+M+93omWFY9hAIlOu
	KksjBPYVD5PZAeaYzUfwG9cl51FNEOb7qKXnlu8JQWvtdR2JtD2OiAIU9b7lst1dqvnGpVVJSeN
	qOl4oxe7BW2PNws+SWtgP4JbUXbZ/Zdk8KlQC0FiTgLjgZoiUW5Mq4zgK5+GOAg8HafPJdCnM8A
	9blHOVRktbZ+CUtCkMh3EGmEQBw7GWSEKubtv7eh5egPdgmP7cU2Tw5hR+wqXAyHai9+GJW4wKb
	6Ds9IYxQVR74P/X+JBOEniMCcCDviCHb6F8rHpc554XhXNs0KGXWxM7MA4huPVYOMzTme7Q1kSr
	KBKG1xLVoLOFQXYJnOyg/1LZVyLIy2ClByqB7i4RYDVJGDx+IFQuyXFEmZCHXqQ/nTkFlSeM3mO
	9NB1yg3+em/fH3Qdep4FsStLW8tQeUnL24zo4BErGQnRPSgu2OO+fgWPoSryKzaJtgwXFlCIIGM
	SV9OdXovjS2eRkCUaoTJQNT4oB5ssy8huNXk6t4jDQVL4N6HYa9e6j/GAk1FzJjDW7FEjDZ+27y
	quRv1QEVKm0NvSXqDT6fgbE/toNxZOp+uN1+sLH+OHJFX479kn2t7So=
X-Received: by 2002:a05:6512:23a9:b0:5c1:ac60:14fc with SMTP id 2adb3069b0e04-5c1bc7c2ad1mr4864356e87.19.1795503625540;
        Mon, 23 Nov 2026 23:00:25 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33b5csm3615530e87.8.2026.11.23.23.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:24 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: Add Cortina Systems CS7542
 global control block
In-Reply-To: <7bce0280-704e-42ce-ba65-d3ab369bc20c@kernel.org>
References: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
 <20261123-cs7542-syscon-v3-1-f1c07a1703f8@gmail.com>
 <7bce0280-704e-42ce-ba65-d3ab369bc20c@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352883.4.9894258481538485863@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Krzysztof,

Understood, and sorry for the rapid rerolls. I should have left time for
review instead of posting v2/v3 while the earlier series was still being
reviewed. I will collect the remaining feedback and avoid another
immediate reroll. Follow-up fixes will stay in the preparation branches
meanwhile.

Thanks,
Fil

