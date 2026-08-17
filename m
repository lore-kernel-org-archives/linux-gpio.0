Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6F33ACA6E
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 21:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003509; cv=none; b=jTNdSkc15g8io6DkXEgjS9+qNv56pdtnWJYHo8wBc2NTtTTiIqyXqhSf69YgKWFSbWjGIJ0vwWcotqXmqVxnoEC2KT2dxOVPOoUrSbqtibBSFTshmnOkSJvydl8M2bAKUNw0FCoQIN3RaVgdR9lBSvKOtUnImNaoseCkLIs3qCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003509; c=relaxed/simple;
	bh=z8axV1g+W9pfE2wDh23MA7BMV9/Ih6BX4Zd+Copaa7k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=XQ3WNT7BLZoq6FfXj0PDpD1uYWLYBopSYKouLcwsM7/MGJASuKsJz+NU9a0p3zRyIn62pILu3XrLCbGEGoqqmRbMTNBaIfmGvVcw80WI7zxvnyhWBLI/iptuz4emawH+bXppHmc9Gv8fa0TZlKIiueFnBa6pA+JGNoydaIXTbBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwPb9UW1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwPb9UW1"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4815bce4652so2437514f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003505; x=1787608305; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z8axV1g+W9pfE2wDh23MA7BMV9/Ih6BX4Zd+Copaa7k=;
        b=jwPb9UW1SX52Fv1b9fs63kDA8krQUwh3qpouH7m8doSy/473WwSy7BJNXDBj0DL1SM
         9WBypivTcJoZeWWAJx0d0/CyFRiAmqgWuPf2i5KqQsnjoDvDALp3TBiQFHtlMPmh2gUN
         /yZ+hTIvbZUP1+PBu1Y6Ag+PcN5AZgajdI9hwIT6TTugdvH8V46JTqQhklsIfMTwYdwR
         HHwscat7OX6KsfaMWb0Y1hf3i3rWEc89JbJ50if6xaRUrVGMBXxz2LNO80T2g1+mWgxa
         izvwW5U9hz47WNLCX7IyI9PlrQjqdjcxNqO7krs84/UiGx/z2WYlqQj7hN6ItvCdF2m0
         oGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003505; x=1787608305;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8axV1g+W9pfE2wDh23MA7BMV9/Ih6BX4Zd+Copaa7k=;
        b=MWIFYFi8ErOPPGgsGtUg0iNPDJqJQG3VqCdPPtHrllg6wLzQRbwJULDGxI6O01PHJR
         p2CwKwkPVfA9iOtVkGs+YX3JKMdxw1zqBoaXwqWDcvjUYNoOYhvCAUb256s9RQ/gOKqv
         eN71oP88sznte8hM9cgPV8W3sf0611VhW6PpVNncmxggfdrncDG2b4mukOIW3dK0Yi2s
         6vjp+FAOSPOdxxwe0EWF4k6wxwyANWqJwelSBdaYmcleOCzqrbrgdl+jAtCvPsZ1APmw
         oIQY++f9MP8u8qb466JEwrN25zZXdppqBcp3jlp+aFunTp6fc7xyGEc2FUHZLpq0ktM2
         eXEg==
X-Forwarded-Encrypted: i=1; AHgh+RpTapRuBE3YgjmXb8beNU5vOXDKMBgrRHNKtcBikzSaHd1RI9yEJK8IuV3vGK6OGdmLzTPuib3hJjli@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2IUEciZ3oW2GWmSgU+s9LDloC+YBi+JQ+YztklsK1Xk4xcF2p
	LgvGSmtYBel2sHWAJ81Q4jZviKI2ErdQF6w8HI6awhjMblUhFvAvud+A
X-Gm-Gg: AR+sD10gPf3PHcOHjOfHA9JLUtoVX5kp0t05DZce5/FErkauhFaqdKP/0B6y/qcecrD
	sd3dlkWE3Z9SbI76FMoQs4GSp7JmqivU5/VXPn37OtpWVqVLVq0U/x6XRdMzX4gTPMqYWYW5qt8
	KFyBTt7PQtkfcuAN8yCUJv03Az4W0msjpshLhPo8KoBEPBI8LZj2Hi1ym+1vV5qI5CG5s58XvpM
	prk2Yc16Mt4chukOmF3h6A3LM8Hra37Ado9TtBicLf+vuh2QQo0k4Q2R1bzi7EbPqg+C3Wl48ef
	AwuROj4XgxIiaCOu3HSH82Qg5qtlxTcTRody6TIZR1x6sFODRNJFzXYHsqMWf4KTHctMu7QPWIo
	UZm/9NqGpEthI1hm80dnZoIkloT0hHp28tBf6DutNaZLyYCg1yk6ZTYqvMgBPCSK6rpvJS6r4Ua
	BUCHumF/4J9jkUPtOlH4hEbEBpq3CLULhKKy9mRcEEbgkmsnLIuU/W8qKfD5PhsjnvcAy30gTfy
	nZ9VQbAQtJlM9CUMUtSqyV+xanLQzddkuqIrHOP5rz7Bd6leCFYeO4=
X-Received: by 2002:a5d:51d0:0:b0:47f:f4b9:88b7 with SMTP id ffacd0b85a97d-48160723e00mr37583370f8f.1.1787003505347;
        Mon, 17 Aug 2026 14:51:45 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm7267823f8f.31.2026.08.17.14.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:37:34 +0200
Message-Id: <DKRJKMECRUTC.125CT60ZV5WKN@gmail.com>
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>
Subject: Re: [PATCH v15 14/22] media: i2c: add Maxim GMSL2/3 serializer
 framework
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-14-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-14-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

Inside the err_revert_mode path of max_ser_update_pipe(),
max_ser_set_pipe_mode(priv, pipe, &pipe->mode) is called with pipe->mode
itself, meaning that the equality check at the top of
max_ser_set_pipe_mode() makes the revert a no-op, yet the hardware keeps
the new mode. Am I reading that right?

Kind Regards,
Artur Andrzejczak
