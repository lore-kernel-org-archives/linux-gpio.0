Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729971;
	b=Z6S7dB5RE6vZXbTAVoyaTX2jjw2vvKy7/Lqux0zrgZUC2MTr+1hpngDi02+2GASXXnhS
	 PBj3yL6ZMPQCRg2OFzmDf+8sfXNeLST+EbFBsmDRnQ1ZetZu3Z/tjNqtY5yIJ60WuYSm0
	 DUGShP5OwQyeVVYNBhT2Pdg15ZlfmSh8PQJpy7MYrR+uABHW9dD0+qbY9CoAs54YEz7TV
	 Zx9LE1e7N3UFboymHaIOv4X0pYX25uDyHgGjWECQJYYleEc5Sajji402mIThNYUTTIkIJ
	 Bm1nUyoDSU7UHJMuZ2OWK7z3y8xNjeSOl5pEejqnkyG4nV5NP7exHkEsirbmnCusB/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729971;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nA3Z0k2qN8XhvQKCf+K+RDIV2RCsTI1GFYw7wVXa+Cw=;
	b=AWq0WdLlVj4U+U4Vz6FF1NJwcrGVlaErD1z2A4ow8pf1rqx9/lRa7XZt23hrBzpYrKoe
	 d5En5vlBAOrQhB0GJE62sucTBI9bWvgDye0k2NvnP6d8XaNwe1ueZXPxaitl15woLfRsL
	 yM3gT90T4iC6rgtKOUwdxLN9kEgBzLSBojTXoFfdCD/wYCshR52TiKGw90h0ciOW09Mgp
	 AK96ZyFbR9XMFOYEl3QezXDMcpNnaFojOMMKvYt7F14RJt3cTmNje3fGWRoNPh9dD2uvf
	 l471jkQjK3xWFK/3t7+eC/CWWxowI/pakJbgdWPcsMUXfeGjoEoga2A2NFmm8XbsNLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3938606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 21:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3938606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b2d14968c9so70828187b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729970; x=1796334770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nA3Z0k2qN8XhvQKCf+K+RDIV2RCsTI1GFYw7wVXa+Cw=;
        b=P6+DMjkT2oMPmUSj5vxiKlJweQfJCgbuMqwE2MU6X9kFvUguC6VcyxkEGxIkli0slM
         P7ROE1k9r/CLiFyJg59n6UiepFup1r155UmALGJ4mxm34vXiJk5BczXiD7Ulp1o/D/+7
         4jP7vXw1bj+WSUPTFgQ7aunk4ah0JssftPWjmlBf2lOxAJOJUeRxVxgS4RpsaRnxI4FC
         evaTl9H2PLGvYSfkOsw99untYHhILv8Ymx2K1QNJoLO8IzUzhQYuUrYLjNPYhJmEw4/X
         +WewVyuIOYXzmQYp6KepfVcF3M7b97Wh6rcf8RiP8vel94FqS8YzXxHTwfo8stcHlEXX
         iLEw==
X-Forwarded-Encrypted: i=1; AL+hErEOdTR7xBskh+KhiZPSqREvR/z3TFJZhVVzjZ1xq5NPaPqLWnG6CnfYMtSW18xpLC53FP9gRVplhlFI@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bf7HI4BVg5vzhcBB2Prk5ikjPAujHXJSuSklPtTsr5Jf1uzae
	v37p2t5Ecq+fPa1UgxA7FqD24/jHS2Y7FUBsn7eOJ2OhRwuK2b5C+ys0
X-Gm-Gg: AZFdTZfC/KZSDeA9ssHJq/VDd4s2eY0WN0ugBL6jd9qEsADWqIN+3PBQ4a314HbnNls
	ZXZ9OaGN+sTjQK4ApJ6oMfQl6S61iIiuX2dDjs6IUqDU4++Pm4c1iWGB2elqpporYQ2TMr6HOAz
	sRYl7K2AKze3d62R/8r336ooeq5gLKn/I++fRq0Z+nMw9bqrUoOciHV7qtbOXyEeUUI5hQhEDxz
	aMJXOzlNPI0coTJkmYENPMoix1eF+H6ZWtpbb1EtUDy5hUjT1JqvtkGZEjuw5UYJZ3CrvrMFFFk
	fAXW/h5X6zGg8i6C4bwMRknyDYkKcx55L0b4V+j2W/qZ7ZgKd7J8iMwm6rbAiP3romu0tlvLbcj
	vQ7AhuQnyflKMPPJi79DvbY9FYLh/RwQroYhd5dx6KqgmkXiji2n+TvlnVn6octKNnGWuextJQf
	fe+XjYES5iP51yRoPdkcIGUf6AjOznS4PtW/Jfc/ZgPwH7xF+6zMlntHOXsivp358ZWwEwjnZx5
	8DIFYwZ3HCziv6dt3wePFvsoaVTFXcHfILz1OR/eZ+ijEAGiwbMx12rIy5d/ktfpcKgUmu7Zp51
	ONuaoVSZDuL7V18hTss5W2rOJy3nAFiorJEZf8kCarH94xDQzaCrG56nwIyIQfJKNyzTg8pfp86
	Hq4a6wKncaf0CE941Er/ZgyJlTTD4TLW99Dei72Za7nCekX9v
X-Received: by 2002:a05:690e:478f:20b0:67d:99fc:2e27 with SMTP id 956f58d0204a3-67df43f3b0cmr5163463d50.40.1795729969868;
        Thu, 26 Nov 2026 13:52:49 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67e6aeb61d7sm21209d50.3.2026.11.26.13.52.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 13:52:49 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: Michael Walle <mwalle@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFT PATCH 02/13] gpio: regmap: add a callback to create the IRQ domain
Date: Thu, 26 Nov 2026 16:52:46 -0500
Message-ID: <20261126215247.14838-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126153600.299724-3-mwalle@kernel.org>
References: <20261126153600.299724-1-mwalle@kernel.org> <20261126153600.299724-3-mwalle@kernel.org>
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

Tested on an SF19A2890 board, with the Siflower GPIO driver from [1]
moved to .create_irq_domain(): gpio-keys interrupts on two lines, and
unbinding and rebinding the controller.

[1] https://lore.kernel.org/r/20261122-sf19a2890-gpio-v3-0-3a4857ebc84a@telaak.dev

Tested-by: Joseph Telaak <joseph@telaak.dev>
