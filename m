Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729972;
	b=P5Bk96IqQBuop0F7300aqoz9hQIz5mUZzFJ1XM3iQQv90iO9tmUADFxHEgmM2yjvXbV1
	 8DmMKy8ccGhDt1nLUdcNnESFTmSA2P0ml3OHbNqAxfezi1FVrmtKp/HF0fgKQgndHGhZr
	 QPbboaxn8Crd6heoC8Fp60/bSYELkdfR948jvVklxRxt80RiaZ72qmHD37HmYNdSGFvWG
	 acaRe5Dw4gp0ShZ2X9tqLo8w7k7dYRVTjZCImG6F3/xDPFLn09lObL6Rvc3QFrEbT5FHh
	 wiaFIJNvwmcjbpMd3RHPZtQHYf0Ukj6ucVGq6iFU/ZP0iOp6Yo0J1TeHSsRid99kZRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729972;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CCLDZWQRoh49McRXudkta9FgHcZJSiTahx5SXauGkwc=;
	b=NjoOaRjq8T1Y4g3uR3RvbX1J8/SamfMFU2/KsWc+ArmsScDscHK09HDpqM2UOllbLmRJ
	 aroA9npBqtN9Ls8Qcgfjr76o18ukX5LhfqK8Jp6ZDznb4rxf36hbbWVk/EJCZJctKSEsj
	 T1yDns/mYRGZqlAyiCfWGiN7xXrzE3jjLtkRQTQ5wBgs+9Oer+JxL2Bx1sCFZ7a79ct4g
	 Dpv+BhuXnEbjabf3HczAAgl4tLRts2jTPgCQ+UkOMwj8LuN6m1dD694miks7OgOo8Yop7
	 HxOIbDgHyU8URLIxa+b3gCMsxaJ4yj8jqXToqupgUT7Hx9sUrw9497clcHxTEjy5yQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB27606A323
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 21:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AB27606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so52388477b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:52:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729971; x=1796334771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CCLDZWQRoh49McRXudkta9FgHcZJSiTahx5SXauGkwc=;
        b=tOK7DuIfWIvX8dSjKY0a1eCo3/v+Rro9SAHJAXbRjHvDlDKN/6MC1t2XxIg7iHeQPC
         bLglZEB90SGEazky1lutL/Xgza7ZcAaFO+/UxkojcVOK7BdArXNveDhJMA+LNIHFZA2j
         MajT56/4gV7oejeLcyQ1o97jiMCpOkpONXg6w6LlCv3UyXD5OFd6Rz9o2+Nj2z8pXG3d
         Oj5DPIZtauKBNAsGM1FXsObd3gNFaV6hKA97bFvZnwgZGziyfbU+WRRgH+gmUbXsRMah
         haXtuh8a1LKq4a5yQVwOSnxRaMyAOVUtRMmHq9WTl8TGpHo8fR29leGpayemskK3dEHD
         lfSQ==
X-Forwarded-Encrypted: i=1; AL+hErFNY8riZMsNpBA8Sea1uM76dRmQe+Cs/f6NSJoMUwsvmqxDRH1EQLNusGgj9IGSKlKy3e9BJEXv8Xe3@vger.kernel.org
X-Gm-Message-State: APuU4Z/tk/IluLpUqT2FsVe+JxQwfz3qpbAtlhztomaQAsondKAd1D0J
	kKzbnWUw1AsJ9v6lMyqzga07okTIfZFrlV1ex+3mD05MwhyVgehggFTs
X-Gm-Gg: AZFdTZdTSVrTbVFiTMPa7e3Q9uQWTu3uVpLZvwwD3E5a7q+eL1cRXhZ4KS7ieVJThfv
	TGbeSqNWFHqHuQEIFG9Uqb6z86NtO9st1WauHD4+du+iJgF3jIUF5gOoCSva+WAUfip1jz+6k1p
	M/NQ4FEOiixkLlh5rzoTIRvh3re7An9lHjh7T497s5atcjZUKOGolPX0AfAZDWehUjHIl7zVfGx
	7FylaHvNVJOlAyjFRdh00uOFKnX/bQmk/XvaPlqvRfImbUvLDZvQZn2FHbYg5hMrCyaEfyK21BX
	65s1q3d5x29Jx8VLhmKOWvKtrST/B0UysUE2vHB8shSV0K+Z6oqDOn64CIkpS+cfaYPBSUEbNEV
	Ngm6PYvELaKKa2i1dwJZ3qzVMMPwaWxeRgYJdTRLmdwRwpNWtHWZePBFcSUN+wKh6peQ2K0vvzA
	4oBCnCVOCgIYgFPI2oAZmnak/fZD88As3/XEK8yVtzZEM/swhmfbBdtlmJkUKpBjNFqySmSUsck
	AEZ9Oqmd8YBu+nUjeiCl4n6cMgY1wnZpy5ZSKspBj/r0+Fg/PDr3V0oD4gNYlgeH+woDVt3G2Wl
	/G7Z/ts1ulAqIYmx2gFOqKz+emyVRyC4FBmQVMn5ThH1Pk4bEaNFQ/e9WVDjTjc7DXLKRkJ2bWp
	NiqStswNHR+ZvxdaulA2E0G9qzpupYjJ3mSuNpgs+Q25RCkRT
X-Received: by 2002:a05:690c:e1e:b0:8b4:ed94:df25 with SMTP id 00721157ae682-8b5204aa226mr108746257b3.36.1795729971547;
        Thu, 26 Nov 2026 13:52:51 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67e6aeb61d7sm21209d50.3.2026.11.26.13.52.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 13:52:51 -0800 (PST)
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
Subject: Re: [RFT PATCH 13/13] gpio: regmap: remove irq_domain and the regmap-irq configuration
Date: Thu, 26 Nov 2026 16:52:47 -0500
Message-ID: <20261126215247.14838-2-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126153600.299724-14-mwalle@kernel.org>
References: <20261126153600.299724-1-mwalle@kernel.org> <20261126153600.299724-14-mwalle@kernel.org>
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

Tested on an SF19A2890 board, as 02/13.

Tested-by: Joseph Telaak <joseph@telaak.dev>
