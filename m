Received: from mail-ed2-f41.google.com (mail-ed2-f41.google.com [74.125.228.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F564EF142
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663922; cv=pass; b=WlJaAlt6c4AOnHNygmbMFZmO1uYy6hdkfwQxhIoIeaXIY8xQo8h3iH6YiyErzAtl55sKRdySk09BaiWLH5ql0BwMY9v+fAykxp8dTlBB/RgNIyyI5gCgY6Xqij6lF2F23/X9jmi/0VmS3WeNGuDiTdLu5lBFnR8XqlfL+2uorQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663922; c=relaxed/simple;
	bh=hEHMAKUllCDwfWN1D2DXADtsf72BtNJRtUxT6u8f6tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXcW8snae5ryHN35gZdcumXpET4GO8KSqG2+LZYU8fQ3XHMyAmR/amtwRMOwLJlKT6BmFil4rZvzrJfGF0KgOJs6JiCKHIrCF02woznTvxrigZdlCMQ852H324xokx3IQ0NSWCiPX0sByChe84a9XYk7UAZUoeGgTbw0CbdMo/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Umdir/c6; arc=pass smtp.client-ip=74.125.228.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Umdir/c6"
Received: by mail-ed2-f41.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so1962256a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663918; cv=none;
        d=google.com; s=arc-20260327;
        b=nW9AKMC0MD3UK+9/cmJqo8iNxJHctg48VUgzjQzIgKSofdv1N7ML+EQFKMQTNb0Fnh
         KGKKjt0XAulgcvpJTZzWfKEgF6C30Eq44waAjPKbAkRiQxiO6z1rKvjrQTg8pJP3bOWl
         FhJHR2ukoTv4h2qQtglNmms9/DSrD0btPq/mEM4zyfAtcD7XdIDhNSCLJ5CJTwNfA8+E
         mAH3BhLJrVVdjjGflHQkzcVWzB6lyBNkq+HVXKxvRfO3vRvsZjEqwBS+SiV9N/OVWB5V
         gJJ21uG6Nj91tKiHBKB78q+/tVOqE7yShHjKrAQt7bGHQtf2YNqcyiwjOKO7Yk59RkxC
         kj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        fh=xem0Gf10TnfgIP14h0S5liL2RtZ6oQA4Uqip0EsWilA=;
        b=rjHQvKtMzL91t+tS2gb0ovfP6z4XO45woDGjgIYpVdlfla0OmUZoLnaM3DDnWZ9PdP
         GeFhygCAlUVvloB4WP9x10GFzpVRj3zBvY4/eKv62bt+TCCEcumV50ez4N+HQtk+oScI
         EcZ4/45vOcbNaM/lsH4qWiVADuivcOTfH0nvnQ1K/sXpb0sORJ9SaTW5LUfOBkFwsyPn
         GC+k/BaDOcC5lwrTjaZ45pwCHRBkpNtWBELFdc53IjClBLdzxzk0d7Y7XgiBYXlLDr/r
         5BCV5zaQpb2dgV9ZLW3ZoVn+0B+dr3UkMMuabJQcgR7l1KfKCBD9nB4EadfRxjwphMC0
         XL9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789663918; x=1790268718; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        b=Umdir/c6HrNFBOOQJduM6SqCOAdwSy6ZyL+u63FbbjqPSkqXRet/5s+yDMp4YNjYN3
         Ita+VQyRcFzmRG9DQvzdjIErpzAlOQM3yfnWdmoT+BI0uhEAmm7CNQ9zBBHIE4PTBJsT
         u4O29zn1XHk7lfqMIu/0IJrlYch/5fZv5NcCYTQPSHGed7rsq3bxmci86KIG4CKRPazG
         26n1ETA8jIThSMYV/LUhzaPBsjUpNVu5R2qhDe/PX2P05Y0mkxSf6WmsJfcI50NxbVuT
         zhHAtNqzxvTxNG7xhPfFeuQyvKu3USpvLpjVAoPyXm6bF5jAtEYIiIfgReVDGHskLX5T
         ecuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663918; x=1790268718;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        b=nPPzFfRu2MpvtP340hCg5LrlIGtUMTv/3cGM8CaBm6ZX5MBBxiLoto6iNuqY7jWxiR
         g3l9bpH/gabheBuSgbG/DpaaQPv/w+WfBWYmaBcqgJ5c7iJpOsaydrNKVGuhcYlYDhjB
         8vLxOiTTxMrsx185/kS7FOm4pnc+d5+pdf+O6d0Dljj5Yr5AndQSFNdAwjb1qLonBTuX
         FzjgH9PYQcAd6wM4orZyclxYyNasyqPmWULOL2Lzt2QZeE4N36e9PjMKZFSTKyYRIWA9
         OtcspYkEIgNDtM5FsJg1NiZ5ti/SzkZ726K6/M6HvSX/kCqOJRJy5iwx4WbvlCfOKPYj
         GNyw==
X-Forwarded-Encrypted: i=1; AKwUvBxC1XLu1BOFTEm339PaMF5uKpd/81OsePaOnEyFO+3U5AJQGbLkgk0+PGxeD0MrJlvbol0f3sruMUb3@vger.kernel.org
X-Gm-Message-State: AFuF++mieFD3creSSV7H38DT3+5brndPNdIt43rE9FaWUf4HUVrJDXS0
	koHzv5RK+J9NaGlop1zQTPQdxUbKKRhgdhC+CF+DoiPEswfOuA9i6il8BIiyvDPtYPIoAbuRshV
	3mlhtxl80BCeV9aHP9D/U7DfEKIhlz8Y=
X-Gm-Gg: AYBFou37L+/WjuHTCUommT0jTg7nZwrTfXiVdD8StXdtvbhDvZy2G28MOJu4TNKvYkc
	YCs0zRjSPPu58MN4KLPRq6xUU/ujwUdtsxT3oa//++LzTVFNMF8t0XmtbsWyh83D98eaoQZUbWs
	uBoIvcggj+0gJXizIxcLDT20z1yAJ4fhLpU75mUopWmMiuTgRSJQraeoAYP9eW8tTuS1toSN9VG
	VozHaQ/GvgFoNTv6CMMo5CGCcDpaIXARPgCBO+49arlq0QrMzxjLYb5TQe8yekJwAP4FHUfFFos
	A3JwE3BCUMZdpVcM97UWFdSF2zvBmpcpEsmXOxxYCAWWX+INmOw1k2w=
X-Received: by 2002:a05:6402:3789:b0:6a9:98de:6d8d with SMTP id
 4fb4d7f45d1cf-6aa2245fd0fmr5568315a12.45.1789663918221; Thu, 17 Sep 2026
 09:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902193351.185771-1-l.scorcia@gmail.com> <20260917143459.GA2348773@google.com>
In-Reply-To: <20260917143459.GA2348773@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 17 Sep 2026 18:51:47 +0200
X-Gm-Features: AcwNN1UCLyUlHms-nbsVMpe5KcLakQ0vi0ozu7P9tcFuOM-WKvxcQ6ubbojqdxA
Message-ID: <CAORyz2+rT-oNJtWc5BRDrpUjBPVbO6A=qrX_K+J7fAR5Ebm_3Q@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Julien Massot <julien.massot@collabora.com>, 
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Still waiting on Acks by the looks of things?

Unfortunately yes. Patch 4/9 [1] was suggested by you in [2] and it's
independent from the rest of the series; it could be merged without
introducing functional changes, but I don't know if you can provide
the Ack for it or if a specific maintainer has to provide that.

[1] https://lore.kernel.org/linux-mediatek/20260902193351.185771-5-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260520150014.GF2767592@google.com/

Thank you
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
