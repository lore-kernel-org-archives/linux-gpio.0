Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706831;
	b=Mo3IjONxeZNDKz+NpyB3ROu1n5AudvsCB/J5/iQj7ciJansUULQD+syJHq/dQ1cUPOnj
	 jt8AW5qYc1+53YNwMmqVgxT8PKULleIUqL5aiiVPfE48lUfmvDyGc0LtwHPVQsp0mi4e0
	 GPgvDjWA2fZmiuVXRbg+CHRzk23eWPaYLAXaNYHy2biipfLH/yDpzLdw9fNH/vUMz1auK
	 492Q5x7uOPwKKlaa1mBrMQANZYx/j6fQcGO03uR/2IZ4wAzYGXJGkCwkkt+8IFUhjg7BI
	 2HKyn0LJN/soDqB/fNSjt2VUSrMj0fupaq+UkDiKnSrDlF2VJzIXqTiLnmrqMfUL+8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D3r9Q658gfr02qv4CfLMyI+BO9QiyLcf5UpWpj5dPrE=;
	b=R/O1cyc/hRtLmw3ewbOXOenmF0lDm5rps2nOEQABDUSJN1i8N2I018iknqzM5QVNfiuH
	 10afddeWzM2oBENN6LO6tby9MKpn3fdpourHApMqOB0c0erDd9ZQ1hq8OuVIQITpFYxEG
	 ISr41BB3qsIcZOwrzKtKwHqmUdsuPDPq+ErP2lCd2Swd+JCrcYmTG/UyFfdzyJvOBejkh
	 +W+NHkRm0HOYxhKlM8Mz1ogUwHb8dJu7vjP4Epabz4rIGljLIjUSqu0GAW+uRxesi+RbZ
	 qTvRib8VKz2UDQY2w8AN0AJHpX+Bd06dezEpo/BUKcXFph4GurgH5HnNipSHthziGZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0u3APBei;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE3E606A329
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE3E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0u3APBei
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so3923342f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 07:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706830; x=1796311630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3r9Q658gfr02qv4CfLMyI+BO9QiyLcf5UpWpj5dPrE=;
        b=0u3APBeidcNd11Z2j3eXaAjA285OdvSXjJLehh5NHWt6xAxNEA+yxFk808nOV+lKxR
         wTz606h7VsjqgUh2yQ2oWJcCsrw9JMQQ7crRF5Beymr4N8ogKAjE2jfXFSCoHbC2+huc
         0TRrGnBl31IEIZ0O+V5vXWR8MHHJqERUOTHM5JOIPw16TYDG0KjM0O8Ci2Jxtx2eYFg9
         tssnkzzAwh/U09Y2BX56vJHGAsq/K0O6o6w4zvtx6rphXDNkjMpaFNA3An7vClLbUpqK
         L4T+dpMPxI92wNYPPn9Rv6FP50M5UE/uFl9AP5Udx72kK+1lTdJXmYOKUDB8DTOconFR
         R2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706830; x=1796311630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3r9Q658gfr02qv4CfLMyI+BO9QiyLcf5UpWpj5dPrE=;
        b=B2SzFoV+l1ACiTK9fzHxBvCgbsWCzmCq7uFOHc85dQky0cMsAnPgXEkg/qQoK6ubF9
         ueSuFbjuHlIwUm+WRkPRY+PPL0gsVjO8O2DX8/bVzZPmipU1Opv7bfFbnFZx0APp9wzC
         blEjjsV3f3rdna+6lR9k0t8PqEjyljd3Dk5ONGYZ1KPlLoJw3DhEA5zPd9hYh9b6sXSq
         SakBM305hsFUQTVEOHO7UPy2Ev89m7LLvgZEeWR8OvrWuFiv0zzxBKRZxCg1rof/4TRs
         TnDxzeziJ1XcRHopE4fciDrkXQvS9JY77EiNPoAHeihbQMUjTGzp2vvjqaYqvZ4vmCtA
         vdDQ==
X-Forwarded-Encrypted: i=1; AL+hErEQKt9Y9F7oPbzZzp88NpW2B/sK1yxNezwmDkQvLo6eaal/WrzJCjZjO3X/krvj7v2ObrA1GNBEC9ug@vger.kernel.org
X-Gm-Message-State: APuU4Z/JC5zdlHG/bZrWJVqsa7SXa6EdrhVuaIHMptyY+TfwKowr3esr
	YdVEKoKSV0yFZNIo3Jvw06+pQEEQ/GxNm+f28bqMUzIkbJqBowuL7UK7
X-Gm-Gg: AZFdTZc5/qRGD0gjXBha62KFl+CyfjuveVRfTj1vhimWPQ1+13RUdEMatnsJroSaunU
	wbyCHLIYREY0SHVZlMJ34QIi6rgeb6LvpmOMYCwGw3NV8yHCyDMFph1jUfK0j3Roh+LlIfG9Hwk
	IanLssMD4AcXhKWE4kxS5IguqAhIktS0XfGBhSaQoKC7G3mrytyZ7GDAbSpronGYcJomiIurZ6I
	j0AILOSQGvIkg0ECz2aJPndv21u+EqnQ6k2hvWZhNmKGLmPuujWFuMVJB1jyPAnlVx8ogsu/ja3
	tOBQg3vyFLKJBUCcqHt8ZNLKC1ce+D7w/fpSyg2VTZEd7uLN12PwobAqZ6XRxQdgLEJWBrotIfC
	6P/rpkz2tF3ywLm+IQnMSYxy0KRGHGfKokmFE/W0ntoFcUMgq2qjkqTIVCS3TeMBlFWg3N+ZAFh
	f/Xug/u55M+EWPWe8BDCGpo5AFry9BrjeTSCo8AJYzvLlWbc9O75FZgUTUAkAwdgObAHgU6+jVT
	HK83m7ub7pX4MjAf//CumHbsQ7ra4LJw0YnuhPsQW7h2Q/R+vYqeizzwMvehdHIZwLC5nr/7WOJ
	gMTDP2H7I0tJviz8QOaEixTs3RAO
X-Received: by 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr460217725e9.4.1795706829787;
        Thu, 26 Nov 2026 07:27:09 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm619118905e9.5.2026.11.26.07.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:27:09 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Thu, 26 Nov 2026 15:26:56 +0000
Message-ID: <20261126152656.3207931-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <wezjaspgdq2rm4frq5r4wynlsvhwmogxftzb2nyzmvsc5aavwu@hdvb6a2i6cpp>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com> <84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com> <wezjaspgdq2rm4frq5r4wynlsvhwmogxftzb2nyzmvsc5aavwu@hdvb6a2i6cpp>
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

On Thu, Nov 26, 2026 at 04:10:22PM +0100, Bartosz Golaszewski wrote:
> Eek, -ETOOEARLY. I have more patches on top of this already so Stanislav: can
> you please send a follow-up with fixes?

Sure, here it is:
https://lore.kernel.org/r/20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com

Stanislav
