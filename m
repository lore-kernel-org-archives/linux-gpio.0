Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.167
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795102671;
	b=JDJ8j8BeyMDpg3orLExjFLV65tkND/9bnK5AXaNTLznsl3abCf9kfod+3vRPpCmq/7a6
	 dFFz4dNnksK1t/SsUxYvHCUtEQefuKIKtl/Z5BhiRFtHYsxn4FqCrzoY3BK9uNdYpExvM
	 eUUfUD99anfzbEwHcE9li34GX1UoPflil6nNhWA3lZNeQnibnCW1GZnODqFG7wbDDi4A0
	 EW8GUq+PlBUuTWGAsfJLBlY5/3c6B1q6lj/qxpJ9pIHPeH7MEEAxjRETNumFE46R2qoyE
	 CAPDmiS4V3AwkAw4+OGp3GQv7ApRIVdLJmsBWtSuxN3TuIAxRRUTBwXyBbrkdNM/35A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102671;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=su1E+UyCHhrVqldGNWSA8TEe0cDtoa1PSPkx7g6Sb88=;
	b=qYA+yxUKWnbFUde3kdgeZqcENvcPifORwjhwWmYQCxEbePP9kLa8kQnG3CWMWqru3AXb
	 UxT5+ubqOdDiSH8YOaD2Ta3/pVXcw67gKUp8ujQCt5mDNkCkkNj/C/ny1pxi4FFtfgQQv
	 W1UrT7fMoO9Z5ZogSZd//RYyon/rtArP/PUGCfqFGYOrHLMfHKS2YH2UPwaVckqHjeNiZ
	 WqczfnNd0IWM+XBflT5OqXBylkvDXY3slxc50dRhIwAJmZwC8HcHIDHnNx8Sso6gNl9K2
	 jNapXvmyqUtONjjs0MmN+RMBLpJQI3oJbf6i83Jfxo9bX3bL4Ls7EMeOusbexAlHCxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Xvp7Dx29;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=g7PdwMOu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.167
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE24C60A2610;
	Thu, 19 Nov 2026 15:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE24C60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Xvp7Dx29;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=g7PdwMOu
ARC-Seal: i=1; a=rsa-sha256; t=1795102650; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=byOsvyTaulHAewPSWT3V+vzGEirwvY3hHf/RyFzHXE/2JmQd/WnKSopoxGP0fK7Wdz
    cCekItUEqKwYumt7PlD8k0Ku1wAHmDALlPl6PD9wXVLtGGbPJujuzhXVrRCX4ir5CEHI
    f8CoKqqxgh1jLsbBghseNW56vEla9Si4mohu0pSN2yfDQLPAyRfqLJwTmzBV6KZKAKsg
    eyccoF2K7Qfm0u67NZ8Sm7NXxZO7Z2mgvZ1y0osa2QnRP9RMxkOc2ORbLn/R9x8RM1Ck
    LGXVWpOq2EvV4i46wWfjvKngpqsi86GdB4+4k7De5HH20ybz1BJNLNFcn7o4ZC2gDKCV
    0maQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795102650;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=su1E+UyCHhrVqldGNWSA8TEe0cDtoa1PSPkx7g6Sb88=;
    b=sUKXkqXuMwotJQzC3Mvk3htzobmgVsA8AJG+aaE3DDoyCBXUxXSe86dCd7feNlG2MO
    EeySrMOY8F1dkq066lB95wOM7m2ekKJZZPmvAF7UCn8GTG1r2afNpuOwgK2eXxPr7wag
    hV31Bgt6L3vGTp230qZQrbVcgvArAjvC42nxspmlrAJctkOwqFGj7+0oKQm2i+xczQD/
    dKuzLbcqWimbjEde/5hayw4rMwK1qusmwWOB5pSNIdBqPzaX93E/W99Exd7/Xz8+LguL
    QYUJkV5o07SUWWjJ1lrfVo+AJfl8omtHmOaDzIh69HmiL4JfTF3BqRCcUb9atQD2UwI3
    vFaA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795102650;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=su1E+UyCHhrVqldGNWSA8TEe0cDtoa1PSPkx7g6Sb88=;
    b=Xvp7Dx291ijWshcpPjQ6LjHs+VsjogkIcR0bsVo+f3/SoUMaUH1Ia4NB7qtVNfAWtG
    hi19W6bjWltHaqr2sNiAcA3mpZn08kc8zUGrOjRe36FDrSxPOFVv8GDLxlAXcXgrTLyv
    DfrbeosuX//d4q2YqMBBzrhAxoX7Q4Ak8IAoW2p0vbmzvDhf8zcyLAmvownjMpk+gTA/
    7leIlGCDNPqgAasce7hGlmlI8Pm7BqwwbbDE6cXTqguGWFzF+q/qjJo9HuQdzuiB8zXU
    ycJfFu6E5/ReqdLNf010oG8mIA2+wA/KALcin9iK+cxFVVYEzLpEecvYyZ6I4HTaQXbe
    EJxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795102650;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=su1E+UyCHhrVqldGNWSA8TEe0cDtoa1PSPkx7g6Sb88=;
    b=g7PdwMOuXkqA3VGy23UA4SYSDBklVZtzoYnWbQzMMkZwBa4dTtonwqAFmUlV94ZDi0
    7giU7/xRt70INWojumAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrVippbzMiNg6IYaWB/kgKnPFT4xvEDRUsTkpe3"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AJFbTk92
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 19 Nov 2026 16:37:29 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH v4 3/7] dt-bindings: pinctrl: ingenic: Add X2600 support
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261119152516.GA936383-robh@kernel.org>
Date: Thu, 19 Nov 2026 16:36:58 +0100
Cc: Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 letux-kernel@openphoenux.org
Content-Transfer-Encoding: 7bit
Message-Id: <E34DE34B-B517-4FC8-963B-6A5AF14409F4@goldelico.com>
References: <cover.1795022736.git.hns@goldelico.com>
 <a8688e1ea979dbbb3ffa198ca041b31c97752bad.1795022736.git.hns@goldelico.com>
 <20261119152516.GA936383-robh@kernel.org>
To: Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi Rob and Conor,

> Am 19.11.2026 um 16:25 schrieb Rob Herring <robh@kernel.org>:
> 
> On Wed, Nov 18, 2026 at 06:25:33PM +0100, H. Nikolaus Schaller wrote:
>> Add the pinctrl and GPIO compatible strings for the Lumissil
>> X2600 SoC.
>> 
>> The X2600 has five GPIO ports with 32 GPIO number slots per port.
>> The programming manual lists 113 implemented GPIO pins.
>> 
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> 
> Missing Conor's ack from v1. And then he acked v2 again which happened 
> after 3 versions in 24 hours. Please add tags and slow down your pace on 
> new versions.

Sorry for that omission (there were too many comments on the other
patches). Will add to a v5 which is planned anyways. But not today.

BR and thanks,
Nikolaus

