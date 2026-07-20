Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65712DECDF
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784564255; cv=none; b=FDdFSMRVPaaz1kZem2GM0aZ2Mre+pT52X7d1OalQS4U/Z4iP7ETIvZkojfjPVf/EZvTZrD04TGgGkgUC7W/PMwfDrx3t+ShLrs2WXemLLZXyODkBsvmHGDD81C9ELd5L1GuEE3VB2yPsrID2yIDHIj3ooUgD34LOpdWN/QmgydE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784564255; c=relaxed/simple;
	bh=pwEE6fibC3x6lQyfDb+v+RGRyll+J5mMBnA1XQCUdSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cn2074osgk3lm1CvFcLBs5lgYByYhGphxQ61QOq2OeMaAb7W6dop5yPCR0R2qSAWccnfvDqKSUdNqTpzu7paLJXuip5zGHQtVCCP6qkyCk6KsS/QH7SR6KO40l0rPO3TxPxD4FDlhvavWJLKKAslRPjmIT8Vz3VDpICslqXqpHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glK0Koa5; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glK0Koa5"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-caf707e3a70so2368174a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 09:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784564252; x=1785169052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bgWQqTl41PqRe7SjquS4u/1d/gci4UsHSjvtso+pedQ=;
        b=glK0Koa5XRPklCAw9KD4v+TkkXZHYNHYgtVvDcS00F45H4CLkHqOlXa3ZY0ypll8fo
         z1YjR7qang0FdqOLx82+ZMFV5KsAyd0TuA/FG7tZO700YEtlmv0edx+qyK/BA8sgBuaH
         zFjmGibc3q6FRpaVLTJwUiCcsXyJ5vbBRgJEthI44QUc7Th6j0bfkIPc0DG3fxpqPWSF
         c15aJVIGmpQ8OujJKOanW7PfJ2hyGIs5XtM7O8vOHYiJvbpHtbj9i8wWsT2IhtHRfjJp
         r4kjhECS+OmOJ74TCvlcDo+SQTY3sqEV4U2kcMc2it9OERzs979Ts6/uUQvpvAS50vFP
         WTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564252; x=1785169052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bgWQqTl41PqRe7SjquS4u/1d/gci4UsHSjvtso+pedQ=;
        b=k05UZjeAKzFoRAL/A1d1JdhP6k2ZxrNTwJ8dZp4cBIFOZO3qY5+OVZIWTrwWa9TFuT
         ht1mf40GxKPgC+0Q3CzKOZvv/K7SwjR0PEH9/83b2ByTAyAkUlz7qBDO9FuqtnasUj6/
         6XY4RIjr3QQSrFej9EaTUqeQdXk6VrpxsmNwFQcFj8APbrb63NU7GWkQ64DxV8EVyH4N
         ANjiLZeJrS6/pTMeCxMMNKq7KdKJD/LshpxqIHiyYo0oAILc8FFA74ZL97CVE+PNPqBC
         ZFhCtroBKZuF2t8UTJ03xXT2YhicOTWAx/Q77e9vCGNPTckWpR5JS4yTGEymhr4w6vDO
         4SbA==
X-Forwarded-Encrypted: i=1; AHgh+RoOyqyRD2gNZaqhtGmMmz8eRpuTRQHbSOdqlwHpYGj9flyYArXKk+t7gww3GRWaS+0ADsKppB9a6eQF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Xf0vkIe7+W4hM34SKO5x6aN9o+g31U4TpeBvqRZ5G+kcZDzA
	9cnsNLfTNuG6RvIZ02+pUDj//wR42icbqwQczSYdQ6CcgCoMqZGMpna+
X-Gm-Gg: AfdE7cn/N8UzInGbNnfUYpx3U+VVvc2a2NP0JZTM5cW/32lYAlpSb7rExbirbZxMUL+
	6FeJV+Q45NrJAcbqg8YSVneV1tH+JWfUBoi9sowNr8ZsHPh32MIAiJaMC/CxlMizvkxc72SbmOW
	G3nq0D5bgMlJ9l2TfcyPKrFH6PmaHd6BsEgk0KDBRAbSBGHLEfmWgsD3jUOWxFRJucXB9J1h+OS
	Js6hwpss8Sv2hrkQpPOGLMe25CChCIflFqUCmrL2p4UtmWuwu7WLBNs7X7m59AHIB9Lnz76RY2Y
	toGUZO1vaMxcoBUyjMFlEHuQmdB+3AWkGmmZrSshxzsWRBg7f5DSDy3eL99NM3p4nzKzHEx2C9h
	TUeYwxGS0RIn4spkHjolweNaahqANePS/5bqWNRbjdFc4nlhk4VWOv8qStEUduWxZd5ZnzN33g0
	t+J7c5qjlVNab3NaRvSM0561hSLg==
X-Received: by 2002:a05:6a20:939f:b0:3bf:ecf8:abe with SMTP id adf61e73a8af0-3c38d512647mr21472934637.0.1784564246909;
        Mon, 20 Jul 2026 09:17:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1ddeb6sm43145565eec.20.2026.07.20.09.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:17:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 09:17:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 06/11] dt-bindings: watchdog: apple,wdt: Add t6030 and
 t6031 compatibles
Message-ID: <f0d4a047-5dd3-484b-9fb0-89c12bd93ad0@roeck-us.net>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-6-55b305833123@jannau.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-6-55b305833123@jannau.net>

On Thu, Jul 09, 2026 at 09:30:52AM +0200, Janne Grunau wrote:
> The watchdog on Apple silicon M3 Pro, Max and Ultra SoCs is compatible
> with the t8103 (M1) one. Add "apple,t6030-wdt" for M3 Pro and
> "apple,t6031-wdt" for M3 Max and Ultra as per-SoC compatibles.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
