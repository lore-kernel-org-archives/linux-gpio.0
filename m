Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A939E3537D0
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422382; cv=none; b=aAy3Gjk/NMoeguzQ6EOOH6G44jXCcmUIAM4yLdVTkltq/chVII7HWXqCEmKQKZW1ID8jl9c0sKi97kTDBCr8AfYvMoDpoReyL9AQog3tismP4hFu6S89Jo2DVO5RtWR78TAC1ClIK4QGGxon4AbZeDkkT0CUQ30Bk6K1gIKoXl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422382; c=relaxed/simple;
	bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJRuKq25E7rFR1hx3ezaO9KARf/yBDLXz7QMGX0TpD/29t20Js+nXlOnYqs/rgO5KHwXXnfBEMg6PAhMusXW5/z+KxxhsLE59+wU0FiQxv7m7Xatck4CCgzKnawUV8MInnLKbT0EgQNtKl04k8QM55lRNNrIE3qMR++aEXH3UXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzPV10l+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzPV10l+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48584dc164fso1134f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422379; x=1789027179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=;
        b=CzPV10l+p2sjcseqG5+rISj6wSfljw507YRrEiZIX/nHDmQGSB3WF5XaKAVlCemYmI
         VEM3/fTF/D6cvRSVKztO+1bnVuq6uZb/j2bm32d7iqF491GbVniXyBuJTXp1Y4wlD9xa
         iE6HGU225t4pgBGNO6eFtEt0Im4ddnvD81bSSE9B9D9R3TDqCQVVVEfI3XUK7fAXyYVy
         2kVGbzDEUdWye3zPwoaBMdqCEZBem+ukv2wBcqWX+lGuQfigWfkDfOViIMKFflNjMld4
         Ur9TaNVtQcl8cTH9Yg/5iKUZ2+xfyNcWxm/q/9D0B6UEpW6eQSXrmkfgIFCAa8SXnTIc
         b4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422379; x=1789027179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=;
        b=svPUlR1eagryidC8H4BCY/pVO8fKSQC24dHcZmUZiiGdm8+8iv+nhFRsIo5vDNz6Me
         toosHAnq/PXRpyzFUKjcdjBu9nVnvHV7tGBiRKdz0GLJ4xxcImEN+x4QsZpVzfP5HoUp
         FENRR73EckGKA2SG5/twMPQxWaBn9CPsYRO+TWcJA5Av2xSA5KfF3ppQU6fId2tbHlKG
         cnyjQW5fT10IaLVzlAbkArADkIqf6idl/FK2u+V0ErYW79Iz3X1qFE2IAj8g/BguSbeo
         UUvpo1kwNfukZRXnazjtbPLEpq9CuiylgZfaOj5/6ZhBLhUFVNMOsVOfmvkpWiS9+KUh
         ovlQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8jfbB/lZLrnNJF7bRWCv0up3OyB1m4BkOtV6To6ogPVEHyhwmg0pVJOkqT+b4KeQ4vX31KK51L/5Y@vger.kernel.org
X-Gm-Message-State: AFuF++nL7us93eQOFmuLFy8qYMQ8IxKGGxA6JQIEsidM7YdWOle1Kbvh
	BQl6S36rpZcMrPj4Rf0uY0JPsmUbq5uY0FfXK34ZTPtFMtg70G0aZ8lT
X-Gm-Gg: AYBFou1DyJNKE0uiEoa6RYMYy39ZAzyQL01vPu+IwXTQaAiWS+pJ56gHdVZQuoAOKpI
	zdB3WQ7dWPe8YWlcnqiipHP++vYPcVL+3R2CDSnP/0ptgodgccHh2ozdVJsQNhxjB1SGLsh1aVg
	ib/7jIwYbipOj3a1zXTzrK0UvZ38f/VsxjO4JfZpo5G7O0s6hRIO0CE67Wmk8+WgVmEqZkcjDdu
	Yt7HTbte8z+cf6rndVRSrosJEx0J/LwGD7CRpb1NoCFHoP5FXs1KxGxLmoVV5nEh8WSmBZ7mwzT
	xBQOoc2Xi30DLlDC4PcskDfukG8KJN8zSV9bnp2ZwvnkXit2w9bJLKNvGx3u0qKWlbjiRP3rVxC
	hkead7a2hrl8rA8FY9cDA1e7fDOPwBFQr4Bb7jgW9/YXu1SQgxyEudjzNgyhHWj2S26JeaV96on
	LkFG6QxQO3V3Neu8kjVBvk6Mu/wF2x+N/0vhrGxolrtiJip+s6COXwKbAXeOlnxBWoO1OejPIhA
	1+NwvQ=
X-Received: by 2002:adf:e18e:0:b0:47f:e721:1f77 with SMTP id ffacd0b85a97d-48488f0f80dmr20736014f8f.13.1788422378643;
        Thu, 03 Sep 2026 00:59:38 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12914843f8f.6.2026.09.03.00.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:37 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Thu,  3 Sep 2026 09:59:34 +0200
Message-ID: <20260903075936.2089280-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903074348.8F2DF1F000E9@smtp.kernel.org>
References: <20260903073143.2068494-2-mehmet.fide@gmail.com> <20260903074348.8F2DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Critical]
> This is a pre-existing issue, but can an unvalidated pin_id derived from the
> device tree cause an out-of-bounds access on ipctl->pin_regs here?

Same finding as on v2 and v3, same answer: yes, the parser trusts the
fsl,pins value, this series does not touch it, and I will send a
separate bounds check for imx_pinctrl_parse_pin_mmio() and
imx_pinctrl_parse_pin_scu() once this series is in.

Mehmet
