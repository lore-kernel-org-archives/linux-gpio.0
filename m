Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035441;
	b=SQr/NNrb+nbzFCO/vvAb9Q7Zp9fVbjDFwTN38V+aywR6TnxmETW93OoNLMBBSn9DJjGn
	 KBVl8+ROlcsWtHP7oU28eHg/xY4TimTPGnPZGq+rQpiSgr2oE9jDfQjgiOl/6Y8h4BFSC
	 kIlI6L2RJrzPZaxk8yBQ2ZlXxR6RCxKQXwZ+8mh1hVauUHYJnYT9GvmFWqAoFx7hPiuXW
	 jxmkkLpYumYzH8VouBg8Fo5DLAWAnK4BrffNBnxY5NAvYKz2ujT5rglMGKVI5aUpv4jCd
	 sEQC0XSsjfLP2Ww0NlXa/h1/Ov/viV39CkYfPb4Alwn7hnrAxTg+uoM0IsOyF9sjaag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rD0rqzmylq+YWadKYJUM3h2KbEjwE3lCD2TvIMgXYy8=;
	b=UJn3RR9m8SQ8GFwiKAyOkaWJudsLAklQSwukLEwpB/yTv9q8ATy3MOnpPkYW1mp4X1Ba
	 EBWVFffiYxoo11iO8dF96psd8ti1d5+walVQSBEJYdB9dILVSI2lulA8gHOAHmqLVETMP
	 f39H1WrrFZA70t4d8LEhaPtWyBOgMXzq3hq+ocl4GxbJAPQZ66M/12+mx4FWYr5qcC4w6
	 YUz6u78IAZW9S/NBIsvgEGEH0CLDTGu+M1KHNW7tpR9xBP3iiXz089V2PR7Xq6qys9Zf8
	 PaclkcAiu2llxsT5ZZx2FNo3jY/12chis1N190nlXvco9XmadcU73ddNCdFy9c7HCyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZ3U6pM4;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8746A606A330
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 20:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8746A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZ3U6pM4
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1008495f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 12:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035440; x=1795640240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rD0rqzmylq+YWadKYJUM3h2KbEjwE3lCD2TvIMgXYy8=;
        b=eZ3U6pM4uWJAg0soB/+ulwruWIsechmVHctntlrGfFAqhTYhXgCJHlROKnJ6NWnq1M
         laW+G5ENbDVDab3NiCysSPmTXaeHdNeJFajmjVOasM0gJcbZ+MfTwYBW3zm54ce1kICJ
         hY+WWaTNVK+KTLU6RflsZwY34xeYZ7hw5ASyRvArs/CPArbC6OKothn8Zv5+huSb5kaE
         HMEfQgptHblJF8aAtmqIsAFas2RViUEo0KFttKWUHsgsuh00kGjh+0scqN7PPKwt1fUb
         RXzhJt1sLYeZXh/FkEEwZDNWpqns2B3YzK6/7TazCF08CXfnRCan/NaG/2KidQ1vyWfV
         rp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035440; x=1795640240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rD0rqzmylq+YWadKYJUM3h2KbEjwE3lCD2TvIMgXYy8=;
        b=e4wO/eJZ2VbspgD9eQtK86v+d+jwvptXIK5Ip3fptrCb9B86hyBHouuUeoBksNigCU
         HJOtjrJMWegQCgyq1hP6h3Q8okiKMwhboZ3MIxhacafoClvgsP1/daDnwk5vpKMjHm6D
         3hRLdaCmm3Dd1mGJMnKndbb0oEuhmz6Sow3KuazRehotb2iA+iavi1Zp6IZdCacYiRx3
         MadvCMCMc8pcpGK/k31Aw8YIiV+602+CKk77RobXo4Kl3bkLOABFdCf013e/JMQy6Y7o
         OJe0hUVS265ZrhtkJ+0ayX/n+4anZ+jKfhpChfNXKYuOqaYodjhpvFoKn4tTtW6SOS4P
         Ozxw==
X-Forwarded-Encrypted: i=1; AL+hErFkFEbPZxDxZf6zkfC2C6cjAAoZ1CdXJEql6I6zQmHIfpXQ3KNmkTVuZ30NSB/8Nis44FUX9lndTCfe@vger.kernel.org
X-Gm-Message-State: APuU4Z+yriKaBI9cZ75Dr/9824fNKz2iSRpQ2XOlJGadDPhhqUbLzgxz
	xT1Jjzn6E1lQM3dOmPP3rQlV/NOUottJWb3VyMuMWE40HL4jYCI4KtwN
X-Gm-Gg: AZFdTZf+94FFYW3okrIUWblM1dPDm7FXpxFdfDm6I63ibkkeLJhT1iE6p2mInAlI6wd
	LmH4uAVbJ1NgyzZe5jxv7DIkX2BmAngoQZGnhFwX0sB7liDMWwoPp/KAsb85zalMr2kuYD9Drb1
	dcVxQT3a7Nvc6kA2SS367WvNu7VjpOWh3Qew9JF+feMKwTtwLYf+2InnSmSiVcJKQHXBpSJS9eH
	WydgWv+C7WC/y5Gqr9duE8Q36rHHnnM7E5xoFejDt/Usz7GBaBW6LtQlQknqlMdkossjvGoB1R+
	N322fhLVfpAGxtDsecod7hLbd0cPnd0rLjwXJZutBNYmhTP3K40C38mn5sHDqp8BEjgSrMhiaTP
	55W+jEK8ukcF4/J78uKLvUTVkiEE1hsxDyqX6Vd4jFhuyq0pTS2D+RIXsaj7dQOn/yTXNOmqyjf
	dldODPui1/yQz8casyhHujY3CqBWGU3vNL/JMpgdcqQrbJvoIGwlh/Tn50urLBLq9jNZ18pSM/5
	EkxHr9jKHl27d7ei70JKiD8ptQgi83lr+Ne5pDbtciIxG/3edtFsQSM0lhXzT89HRIY/QNkL0lS
	1aW5X7mBqywBaphTLJXifwZ7SXDg
X-Received: by 2002:a05:6000:2f81:b0:4a9:4dfa:c151 with SMTP id ffacd0b85a97d-4a94dfac238mr347385f8f.26.1795035439821;
        Wed, 18 Nov 2026 12:57:19 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a65560bd46sm6675311f8f.31.2026.11.18.12.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:57:18 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	dmitry.torokhov@gmail.com
Subject: Re: [PATCH v4 11/16] HID: ft260: workaround for TN_189 errata endpoint STALL after enumeration
Date: Wed, 18 Nov 2026 22:57:10 +0200
Message-ID: <20261118205712.49261-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-219658@kernel.org>
References: <sashiko-outbox-219658@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 08:50:51PM +0000, sashiko-bot@kernel.org wrote:
> Can ft260_reset_and_rebind() race with an active ft260_probe() when the
> driver is bound outside USB enumeration?

Thanks, this race is real. I reproduced the order on an FT260 board
with test-only delays in the probe and in the reset work: the probe of
interface 1 passes both TN_189 checks during the unbind. On this
kernel it then fails at its first HID raw request with -ENODEV from
hid-bpf, and no subdevice is registered. Without CONFIG_HID_BPF,
hid-bpf does not stop the request. v5 fixes the race in the driver.
