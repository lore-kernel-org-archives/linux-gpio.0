Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697977;
	b=afwhtqCycSmtKAuF4mlTZGMWUshwbGGOrYPF9aeN/JEjoPcoEejnaHGwl+i3XTzhjMnS
	 pP53macCtb9ki/hFYwd5teecf7X/e08FDAvM8xjwH7DEvSYmknsY5qCsvOG1KDGMDUgP/
	 rUMt/ZTGxVGtlDzDVwFQksHcCkDeH4PRAmNGQqnrR+WoHONB3zPLuW9QHnA155EgvO0ba
	 OadhMiMTI14BBglhkTyKdl2CH0GaAoZ8Q8Hy372M+jxIza04FfjZECuLLgB6yBbTb14Mf
	 202BsR2lP/taGHc60R8g+rObH7I40+Hku+kEbERWFswxtk1WeUGY3g3id3/ERVrAGAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697977;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=CbuFNKwzCBwTANyN4xscAbrXRJqN0hUMcarfFYnwKyw=;
	b=IYUiRGslpk8kRwOjJGkKp9l7zUaU4ZzhY9YnyWmpMwJk3nupySZXO69AeGW3mr90z9WP
	 CbEH/Wn+wGGJyf2w1h4WMSdoB/g90yRRw01Vum28LlHkDUVXZDO2zvO1FP9S3EVXLLvvS
	 GIYOsgg9axnkebZkvFiRT2bl0ujnaWFTVMqIYzgVWCO5FLOFTwEo76DRG+357rcX6J+Pq
	 QscA0TFhRB8EKdw13MXxb3KKa3ACDuw1SRSH90spF/ILHr0QntOdu/LG2f56Bh6xd4U7o
	 WUkc8x9G8rKh1HLAiW+82zKkoGgAOhVT3nt87quXAxzbm6AZ/HPBLXmRb6Fk4nHCW5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WGFeEmG+;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=WkgTE83h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.52
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6753606A31E;
	Thu, 26 Nov 2026 12:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6753606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WGFeEmG+;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=WkgTE83h
ARC-Seal: i=1; a=rsa-sha256; t=1795697956; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oRTFhrcTc3zm6Y5GtvY6Rb2Q0kRcSIPlON2Y4clsb+u1wE9/eK5y7vums89g7TnbD9
    AmKh37BmEJ8AiLTM3GXdDLsj9SOaLAmSgrr5PqOMbfV27Q7rTmRShTWwD5gkHVkua4Fi
    ICTWjgKXAkAL0kHl2EnW4BVnK/mhwRp/vtswVBvJKbjzxTjjAS9VSt2shpI1dk3QCTRI
    MiWQ7RwJvGT4S2SZNLFkB9uGJJoupE5QiIUsSqbFSBZz3DAgGHybZevxT7WREOrQ98/+
    RuzsPQHsKDmsP7usgd5tZr/W6G2ykzls8XXMdbgDk0yCVHj7xeKi6bGYJQ05POFAItC+
    djzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795697956;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=CbuFNKwzCBwTANyN4xscAbrXRJqN0hUMcarfFYnwKyw=;
    b=ST8cOM4LOGOwTSmadD+2kAY212BbXl/2d5PrqFpJb8jHJryj+vp5gKRD7qBQ2cqiNz
    QxXN0EC3PxTqtCabikHtF9lF7Rsfn7GAPWrwgyFECgQ+r5eVDnx/YOMA5nthYMruHSWy
    SSkTBx0bQS1KLjspF1RaEgPO0b4DI09rTP3x29aHGCFT2VjQHqjAlqYY4STNPEnU5FfD
    NGvPYestkSceOiTN6UK6xWR5C3gIcclZxTY+1L3+3SU1HCmwci9yBBj/8P0KOyaB9Hfj
    gS03KPGruX6JKAc6nGG6jTEfPIzGMZpdiRpnKsNJOJRXXZEuH6gAJmgFv9JImZ3KF7XL
    s7jA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795697956;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=CbuFNKwzCBwTANyN4xscAbrXRJqN0hUMcarfFYnwKyw=;
    b=WGFeEmG+g7d4f1vvjJf6N6S1PDh0jpN293l6PlmBGF/rfuBZ9L8w39MJvDtDMCk8wS
    JrYkNgfoeRYC2Plq2b5HRiaYyziQ3hyhqV/2roJU0jc5G3F5/KTakpWIxf1wjw+kT6/F
    WMwNpnAAAO178GvdYpfBO5U5JLZuRrtmvQeyqww74AWbzbi9Uxbf5SaPVd0ImwU0E+yq
    bfTLOLuZnjfob54atCGUCyCcUrDKI5txjoeZXFPbX8KgYG8TCEtitI7WAEC42HuZ/AO+
    dQ0ygMuJvCHNP8S25icX0WZATdXNaXP0JGAesNl7BrwMf2saWvQq2wCtjDbfJjfC27R0
    AzSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795697956;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=CbuFNKwzCBwTANyN4xscAbrXRJqN0hUMcarfFYnwKyw=;
    b=WkgTE83hgVzMogDcVGO3QYLaT5cLpGgXNr8HKFcdQsufJv+UaA6+BBve3LCBTfYN6I
    4oLafTj3FkL9aNvzdBDw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrSippbmsiNApfaCH7DkazZx9mjmd7hFF4/bx7E"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AQCxFDdE
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 26 Nov 2026 13:59:15 +0100 (CET)
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.4\))
Subject: Re: [PATCH v5 0/7] pinctrl: ingenic: Add X2600 support
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAD++jLn7J7D-gobRYWWOk3Gk9-Ez8YEGT=R0SwYPgGRqWDKQtw@mail.gmail.com>
Date: Thu, 26 Nov 2026 13:59:05 +0100
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 letux-kernel@openphoenux.org
Content-Transfer-Encoding: 7bit
Message-Id: <53510EF3-D9E6-4148-AF41-8BFDC96E589D@goldelico.com>
References: <cover.1795589383.git.hns@goldelico.com>
 <CAD++jLn7J7D-gobRYWWOk3Gk9-Ez8YEGT=R0SwYPgGRqWDKQtw@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.4)

Hi Linus,

> Am 26.11.2026 um 13:48 schrieb Linus Walleij <linusw@kernel.org>:
> 
> Hi H. Nikolaus,
> 
> I first put the two fixes on an immutable branch and merged to both
> fixes and devel (for-next), then applied the remaining patches on
> top of the fixes in devel.
> 
> This should work out the conflicts I would otherwise face from
> fixes vs next.

That should prevent the stumbling block.

Best regards and thanks,
NIkolaus

