Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276703;
	b=qNLtoJ/mSaB0kRc17so6aFR39W2fNXi16GP7HLGO0WPWM9fKrTZ0oK1Zy6n4ut95ey2n
	 5MmicQyRJYLGEo8KFjIVE6JzlYJgtWibYn84+aAln3rl1a3OXY79Z43rI0fCkRUIJiPYn
	 ZnGkJ2ckNhGIK7Z9xTNKN+HwnN6vtkXscDOn/LF7x2WphZw3fD8+ATdHfQdlqHD7+KlbB
	 R8Yxy1uDfIOGQD+6ULhaSN6fP8SSS+xbqyarFtr6NEwa6taBnrcQJ1EK7QnvMYV8nsg99
	 Ku6hXI96Jlmjoi2NC2A1VoxxCGH5kR8n1rJQzoVKogrpRHH1iyPYK2+sGVz5Md55/LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MXJ3yo+U7Doz0e8n3cFxrPAtyC+QNHJu/0qF308IqpM=;
	b=r+Tg9cKIqnyz4ALD6uHMbL5M5hyX9k+ru/35Dt8E3QvlqndX45MtYxWcdjWCBFFwGGW1
	 OyJhHzBTi6sCX885/McD20RGi1/+2PMypbOfVS5ucFWb6rBY3M38Aq2nPWwguhfJ7/X6c
	 BUj4QcZ4hVdpLj/ErSaMUnKoL25zrgiT2D0bX3V9DLlDGoh3i1PcTpjFBf3M8ejBHPUkU
	 9gWNyoDjSxBeKa1yXBm1359R//h9ak3cUg3DZxYwi5K4eobrnfC9oEMQTU9E7Jyn7oNmY
	 /sqsYSfKR0x7I4nlpZyjraoLmicrgCsCPt1rg4GSa4J5ii9N5nkr9TW+z6qP1ytbA7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S57ojBSr;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04B6606A338
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 02:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04B6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S57ojBSr
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-716ea2598eeso883425eaf.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 18:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276702; x=1794881502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXJ3yo+U7Doz0e8n3cFxrPAtyC+QNHJu/0qF308IqpM=;
        b=S57ojBSr37GkFksPWQ7mHSpA6EgjGnCvU7bSS+RLF2Lbj2lioYPgT7ZGOGhZzRjtpN
         UJl9dOi6OEhsYIWXS2/wsKd+wpyJ2lIEYivNQ9Qo8V0FMvugc9rgJhlMk4fNmx15g5JB
         0Mm6l2rMMl1UXClBrlhtIDkT6A+5KJPPYJUdtdLJ7STwjJec+QjQBPc+OWbZGtqfYILW
         t7U6a/4qhZYnWQV3qRwcCikCTg39xg+E3g7VpT+euoyvL8RMwW4TYpyslbpS5Qe0p834
         96r3H+JZOPoO1/G3HEki9QCKpd9KTpIbSTso0NafGWu9J4Yc6Bi8kcqDiWFMAi05Um9n
         JDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276702; x=1794881502;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXJ3yo+U7Doz0e8n3cFxrPAtyC+QNHJu/0qF308IqpM=;
        b=nV+zrjg+P3zJ4XktY0sOc12c1qdFI9A0JO89394zvJAGfskgzi26Sa4gw4uiS6lBau
         whKkFKb2AuQNRo5Vtuqtds2nj867NcU+pXGH7WHvHLvClm23hp3nz8LpfUlj7caDUi5H
         3jlWL5PgNqRFR/fn4DZ/HhTV3vYhsFTaQP+OPmK0I+OG7CWzU64Wr/9o8i0C/77Q4OJ3
         OUJ1oLQNC3AWl1WUW5Q2wuDatQDgg1SEDVnWah2ZWRndVRxkgLWV4Y9ISjOeeEG9G7ni
         ZL26sjTnT1dpLVS5ONE48FHaDTAiltC8Xfka5tYTvs9azlpGUOHeI4cIfhxxrwgqfYAn
         gd5A==
X-Forwarded-Encrypted: i=1; AL+hErGMbLxrCE042b1hvkUXeiEhuj3PtkDo53sUpHxVJxnQP/MWQUF1dxalBH8HNjIp3z/rgqRtSDcsBj7u@vger.kernel.org
X-Gm-Message-State: APuU4Z+173HX2tTQFGZf3DylSPZskg5W/9jepPbxWC3xNBnPiUau1Dft
	rvUVdutHc9RwapMoHhVIh0ibpJk4+5Nfo83UA9TJT9zxhKWGFz1lNdACYfTsylyP
X-Gm-Gg: AYBFou0LXX+QEUxs3FWuFBaOtv5x3GAREpapBOnoeauE0NZnbILbWL/zo8li2kQ/Z1W
	KAYRawQSFqcdiBGAn8sv1LyCg2E4VOOYqCFFZ8zUWGGd5jpynf1p7mNwO9AAR9lzdWf/AdF6gVm
	1A+WDYAdbUcu9zwb8nU3Iz5B784VUbNzO2sGFCeXuxhTXB40TbPDvhcCuBbmJsH9ogsFjPIAbOe
	0cZv9D4CGfTGmhbe6sdWcEQky9hpOXqU245Qh6MNDfv0OSg6SJZoYTb5tPjoaz/wMQB2w9itOsT
	+aSHKAFJXdw1Ur7BL/b0TPbMDfIdaQopv1vpalKVP+2Rs//7+RZEXh1OHCDH18/GumUhDY3jgln
	7BtXapduOkgZD3yYQGI1iJLu4dgwAc50yG60fBjo2ZO2MCgsVo09gGtBJdzV8y1/B7Kor2Ambyb
	HxHyPK4mOTTjRQL8pP0m0JphCwLAs5JdzoTWE5g8CkzBemFfbie0h4HYxg7wGKd8Lv+UV9XBGUJ
	QDl802O+HuNPi/Nq7fG4HliJpvl7ldAVi2Kb9HOtc5fI9a7LNTpBmujInqFCLxN/ol8/4RVEwNf
	KnvNgDQTSxuppQdH8aS0SlP3dRT1cx0pUNMLH3bGpCTBuNbE/GFcUtierwCM0+ZDEBut5DZgHzO
	sRFFoUw==
X-Received: by 2002:a05:6820:f00d:b0:6f5:a49:616b with SMTP id 006d021491bc7-7189e73a44fmr602567eaf.0.1794276701742;
        Mon, 09 Nov 2026 18:11:41 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa034ad2sm663402eaf.13.2026.11.09.18.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:11:41 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Mon,  9 Nov 2026 21:11:39 -0500
Message-ID: <20261109-a733-pinctrl-v2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107000135.6b684277@ryzen.lan>
References: <20261104-a733-pinctrl-v2@gmail.com> <20261107000135.6b684277@ryzen.lan>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

> I guess this has been written by an agent who like to talk?

Yes. I use an AI coding agent to help draft, build and test these patches;
I review the result and send it myself. The v2 description was its draft
and I should have cut it down; v3 is much shorter.

> So as I suggested before: please introduce a symbol like
> BIAS_VOLTAGE_PIO_POW_AUTO or so,

v3 follows your suggestion with BIAS_VOLTAGE_PIO_POW_AUTO, setting all
two-bit fields to 01 once at init in the generic sunxi code for both
A733 controllers:
https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com

Thanks,
Enzo
