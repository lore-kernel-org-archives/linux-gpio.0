Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DFF346AFD
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817570; cv=none; b=qpsOr6+FJTTzCseJPeSB0POxFgaOA4h4x0n3j+uY4wnuCWju6IEbQwq9tzbmd1r6o60ReKdaTycVB6zPUhpqLN8XRqBfbFVh4D8fW3uMBs/myFjz+S52rg7UTC9E24tBpsIHiJrO5mYg/2A1UyZ5ixwPaNxvvRluVMUjGEk7ek0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817570; c=relaxed/simple;
	bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Pt846hU2brvCvzG/8WS13oO/eIf4mZVhlcMVN7mVKzeNpJcoes7PmVziwubpM4P1updMtnawrNzbWo1f/BcjIzjp/YJk4pDSweGwd/ccv2w8WXBS5dBHXrQ8w/5coDvKnUSfVqWnh7wC+aBNcoxKGT4dB/lQUC5Yx7GQdYGT+u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAnj/rcO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAnj/rcO"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4858595f997so2373148f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 14:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788817567; x=1789422367; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
        b=fAnj/rcO80TMH8HFqrvv8EM18bPhxCk3sdYwPAKLF6fGgFJsHO9sQuudWHzoLaGtuz
         hJMenQH3yNR9cJAx9610rIwQtPX2BcSdbxcZSKVXizwBQxtMSgw6siBRJ9UtS6jme+tn
         Sp5buhngBoZr+3vzzVewIkSq8z+eqLSJb1suwCngI4JozAxhw1sSFtmZjBPZ687Ltq5S
         jAnJ7L3F4tdiSpsCA3yz4vHYbUG/PdxGhjPob2tUkXur6fC7s9Kq1wRuafLJGyjNcWU8
         sRYQEDZW/KZqtb0BNPqg/5ZHfH57TN4shs8rHSoETT0FEmdyOsOix+3+l2cZQ1xHYsuA
         wxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817567; x=1789422367;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
        b=dPpEFO67iJupU3lB4/u/z8HZ1NPWghFimZ0Y0GQq5mZ92QxGRNCwOrQMNpIclRIXWr
         xAq9gLoxLVx6uDo3Eaf/sles3+4NYbjy7EiUcChcCIj3PxkPvpmah1hVEmvHzfMPGdOM
         /Pph0asoNRpQYmIBQg6960ek9OQMZTCod0qtL3RPa2V2Ordohe7T129syqdePODCSlHw
         cfBoq6ERI8RDiSYl/ILnwVCe1YpAg8/LD+JhVPAwJSgMKjbFxDoF2hsWmDG4w3P2+qxN
         9XMW5qzqe/x1ZXYWhqvC6P79phiQUSsMTBJ/F/mACf+DPxHs/93zVRgcavnSslwpS23M
         /0KQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfE0lnHc/2CBAPMML/olOCM0Bib7YprBlZrtPG9mo3NjQu0R7fc77xFriJqh4Cn7uHgLjlDTGDqhYl@vger.kernel.org
X-Gm-Message-State: AFuF++llKxBv5NJIsiFWoUgb1iuTN6OZL69o9K7fsEYtxcoyp2V/ZnLt
	6kNoyJoChAcCmec2L6gdlE0ViQB6YLCDuN4/JGwh9JO4dyAgACBkaZWk
X-Gm-Gg: AYBFou1MFVfbVByt1CA/eYKPu9cGpOw+FX9PxH4hczu93IgUFoxtczb50maPGLJnGE/
	z7WU16W6OmgFNv4mNp6w2Q+Tz7a8Wm8NV/iA0E5SquksjFRK+cjBklqw8yqKxLIPaSVBWtvydcH
	KY+RRI9blz1hpSjXMByxEyC8k18hG+EiudU/B+Y3ASUqS58wGBaqcpw8wPpSTtOtH3LS20/MQto
	7rX7yU+xLI8Chj0FnHkVREnlZojlYkbbKEwerRNNn1TEFqghdfswbWh1Bm+Y/2vF5TdIzPaNzpv
	u7KAiOs25+LQIKc0Aa5kY48mbaVIuIOwuzVBdCMqxynjjE70z8ZN5HH0b/HSi/+vKCipyDFNc/p
	f8mgJFpd1l8mseVegDz8Kw8EZURc3T2vXYNrOdK5QLBObAz1H5W5EXG6QiDW14xOCVUl/Dq3hD0
	b6xxF5n613g/LDYMdKKDj9QXOwFqR7qtD6Z6oLrwNxTNKVXz+Gxvezm/JPknjlL6iq03sd8vko4
	OM187r4WAi4A+DFKAkiVPe5fqwT5UfHfRCCICDSHrJiOebNJyCV
X-Received: by 2002:a05:600c:6290:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49cf7f3d239mr547293245e9.0.1788817567046;
        Mon, 07 Sep 2026 14:46:07 -0700 (PDT)
Received: from localhost (178.43.76.160.ipv4.supernova.orange.pl. [178.43.76.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm204268135e9.1.2026.09.07.14.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 23:33:35 +0200
Message-Id: <DL9EN09H9IUW.12C25XA0HVUXE@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>,
 "Vivekananda Dayananda" <vivekana@amd.com>, "Cory Keitz"
 <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
In-Reply-To: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>

Hi Dumitru,

Went through v16 and checked points I raised on v15.
All of them have been addressed.

Kind Regards,
Artur Andrzejczak

