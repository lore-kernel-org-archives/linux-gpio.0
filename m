Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66BF3C4551
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 21:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003519; cv=none; b=nMEkh9wHmsI2og8DdWLzSWE+jOdbVPDv2POn9ElRCYNA2GdZcu8rFHuKiO8vmjR3lfzp2gu3CW1nnaRLu2YDkZSVFK196shoQ0IHDF/gJJevAmt2/ziuwrU2alSmj/ziHyKqAgs3vrS8I4l2rhtUr1tfuGl9GOeNSkbxxy1iT8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003519; c=relaxed/simple;
	bh=1OUwH3vpefuJTu+Cf5X1NgO2KYMRYxDAo1MiyQly/Go=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kMT8Qb+R7oK5nj1eGrGnfiqo1vMwQsbNlYnv9wY9ftWGkWNtyFOVFZ9WGrtsCoEohMULXrcMNypWUfNUr/m1QVcm86vQRVEc72InKEcuzrAhnQurhIgMUfOoIKeJLlDZXd7Js+G1uGuJOMgS/IP4Xz6bOzdRi5/3Btq6it7creY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgqCGRcH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgqCGRcH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so35097405e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 14:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003513; x=1787608313; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1OUwH3vpefuJTu+Cf5X1NgO2KYMRYxDAo1MiyQly/Go=;
        b=FgqCGRcHH9gMgXgzNRGLOMDqAN6BUbNQyL79vnhPflelKoUO9vKhwhQPhQGHO//Bl9
         9SOZLwynKnanaKNhJ+iGvh0BW7bncCmhu9HwE5CB7qAq61wxFmYtZnPCM6mrRM/IFjcq
         zCj0s0YSIdMoG/XPJynktk1hb1wnb0Q0L1mhfdrxaMQimKtiKj5/vVLtxr0vpvmodh4G
         zi1nUU9kkGeUcclauZvj15LEpykYNufMdU+RGiAfpNImeICzEqd30hXai0q2XfFX19Pz
         3IO96DHmuDqSEzmo0cmvnlX313f9NE8nwRJ7l2Av2r36mqU/cbiyq0lHGYSdW6e/KPk9
         O4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003513; x=1787608313;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OUwH3vpefuJTu+Cf5X1NgO2KYMRYxDAo1MiyQly/Go=;
        b=RN6XdRcH4SV6KKpVerXhJU2ncKOkmMiQAYAN30ubgXkP/7w1mCRm6KxKxCKNG/KCtv
         Y5Vin6FelmnI4E8BwHNM8YOPuIaoZ454fc8UluyIwlx4qYuhinnks4iJsIXGLp0e41cK
         9BDVnUyGRgsrBh4kyBOXU8g112cztaGihIiwDdukhsTrZV5t0ZAqLELjGm1WuGEO+jC3
         5uu8tEn7k/IBJgiCNpNxnmQnQj+eWN9zV+XDEBj0FLcMEPg9xsN6dzmdQ2ktwX4iZTp1
         f3SGYUhCEEHOtiBtjVly4VG7NXikyINamiJksMmCbl9qTiAP1izwO621VziEhHPvOXgB
         swoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWPTYbLeXnRYjSIhTzumdutQm7bJZBr1rb9rfhEz8gBjsKtNZNu76nZFb3pL2rLoQHskBnHS9mfv2f@vger.kernel.org
X-Gm-Message-State: AOJu0YxFK+P2dTkPy8ZHNbBTXRTnS7/m/o7NPmFkZNoLyE3bNYKDuMen
	yTOUdjixgUmEpbw+oEC3KmMsZMp1gsw7Z6uRq2nwknhL0Y3chI4XLKTj
X-Gm-Gg: AR+sD10voG6gjMY4csGm2tsx9AnXt3ITiEcUcmXU6szQ3hIZJ+0BHGmPbZ0zMuzi3DR
	VXXSYfSOrRl8gumB/E/RvXs1y2SkCohYR4b2Jo3fsT6L/WCvea2Niwmo4qDgVPalAhndxMn/Z58
	OEMZL76rKMHjW16F2YWsP4/ox1LHSdDW7JbaI4PMLrRhgpPRe8Vt7WNgqawdIu1P1n6dlRWqxp4
	TlC51fPuD6fCM1s5OKAqBvyI9mTixc84levMlX62t8ONKQ1+vj+6+eHEf+5j/gOF0sABq50xNSH
	L34WEWnNk1Jms2B5KUJtt8o0u6M0XpwJT0VEeIsYUSqwvwz0qeJ/3pbiAspq2hw8h0tfMKL9FVg
	WQ2+sjj1d88goeN7yHacEVIamVS3APwcCTu8dOVjWUhk7L2yYSo7Bhjwirwli/MCO6sUnKMvqKi
	91MJ1EM5iKUO4tN/fay0eG06fiqUYuNqrJrgryQL+g2nD1j+ZxitArCpaUpYcDfB3HHVUwaGAZJ
	n51w1vUOaRjYEUdDDN7sMtoZhbNZMiV7yvvbNirSJoQk2EeA5LfDVwtqfff4qZB938=
X-Received: by 2002:a05:600c:1546:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-49987974700mr415672585e9.14.1787003512692;
        Mon, 17 Aug 2026 14:51:52 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a31572sm7076978f8f.5.2026.08.17.14.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:41:07 +0200
Message-Id: <DKRJNC8R41H4.1TJ6IRW0XR5XP@gmail.com>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Cosmin Tanislav"
 <demonsingur@gmail.com>, "Vivekananda Dayananda" <vivekana@amd.com>, "Cory
 Keitz" <ckeitz@amazon.com>
Subject: Re: [PATCH v15 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

Thanks for the patches, good to see the GMSL support integrated into a
common framework.

Small note: patch 16 adds a second config VIDEO_MAX96717 and a second
max96717.o. The old driver is only removed in patch 21. One symbol then
builds two max96717.o objects, which scripts/modules-check.sh rejects.
Won't allmodconfig bisection be broken for patches 16..20? Both drivers
also match maxim,max96717f in that window. The same overlap exists for
maxim,max96712 (staging driver vs the new max96724 one, patches 17..19)
and maxim,max96714f (18..21), where probing becomes order-dependent. Can
the removals be reordered so that these windows close?

Kind Regards,
Artur Andrzejczak
