Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0483B5311
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566422; cv=none; b=dGvOqCrcSjrr6+oaIhJsJbHTbkXfddFdlDytR6oT9bO7Qxhp9vZcFsj+DzXURU8cD0BpTnfRgM/neRtiZrmTPRv+RppMatIX4fkt3x5W4JDntxUx4uyO4xWMvXy4a4PsBtEj/8D0pXluFBBeax8ORa7PSnSrN4TDRQc0QBt3MhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566422; c=relaxed/simple;
	bh=O9QJ1HBFAyhDaJiIDLuTd9AfbF3RQyrm1cC5fEoMDC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chtejWWC1h2NxpA82tCzfyVkvw04PISJinoh/6RbtjshyS9DkyUJwPEu+p+M0CWFgPS5I+0H7CvRthI+Z9XTGNka8MQLoqrRIeIjZXC/9q2CYnD3G5iHpkAJImoIidAsSYFwHlSeaM2xXK45nwDg6PEtglg5ikg3eautIXQFPiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=YKsIHH3g; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="YKsIHH3g"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso2942412f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1775566420; x=1776171220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9QJ1HBFAyhDaJiIDLuTd9AfbF3RQyrm1cC5fEoMDC4=;
        b=YKsIHH3gK3RmNjwFD8woZ9lstw5hyxo9Py1CLR57kiGfhUVUTjsKVNaepfsayDnuz1
         EN2jf7rXYFrx2AYdMwNgcmpVNaa5JLFtJA+48qVDN+j/ssigt6ap6/lOVBBkTrduh+AJ
         207Xb3M89O38MmICaMpl9UtcPJVQ4nMYHsT2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566420; x=1776171220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9QJ1HBFAyhDaJiIDLuTd9AfbF3RQyrm1cC5fEoMDC4=;
        b=nHiPNooU7TdW+6sg7BsUhwSrGC/2RwHUKmlNiG/g0gnfkgd6dzgvunKjVrSMC1IL7G
         NTndj9F1FjS9lONrzsraEPzKKz7nUTd1QmTen1CnLQVfRTP6FYzVmprXSjUK4DfLFDsT
         P0p+7SjfsQ7kCsRpKRBhIq7/ybSXMvNoCoUwGP9mneYaSHE2fwfHUi4UqFLtUZ5+9P+U
         C+ju7ZjGPlqhRmhHYuLy41RtVKvjojILLDajreOPJ69GSx41Fn287xwWcX/ve3xUhFNu
         zbf468a/pjrgCV6kjdIiq9t39DnzIhO18NLmu0EY9WAtB5t6SX+qvLgMDK/SBWLj40I2
         89rA==
X-Forwarded-Encrypted: i=1; AJvYcCUBTg3Q+aJHGh7/DCH2lkIaAsu0V5FYlh3kA61Wr5N+TvTHmkOjloT4oHujSnQgmIrB47vk3sin35Q0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6/sKbuvFAmw3GoBS7QYY0JSiRj/lILR2G4WQIbZt8iaNhB84D
	lxubCPeIhgIcQkpPdfAB4EdpAceVVWzGMswTjZL8xfTLhIUy4t7vxxbk18/7IvmU2P8=
X-Gm-Gg: AeBDieuSsr6fLtGszPb8M8kaz/gKXvgd+pPlEsZUS4Gtu/i6985bl+PuDTPjm+2/04J
	ZARs1SyPjc86MgHCulvwh0cfaszzRjIx3IUsuRCsIflrfTjesp1PuGNhgwxcsHhUGI0Av/CV/mP
	w3kS0qj5WjBNwFfxyDF0QFR96nQ09zdITpURb1BI6GyTtK0K8Zsj8ilBHS90kMJUy6YOYW1TmpU
	LWYZYOvjyumzPwvoGg9qxFm+SY8Q7I1TQqULoxdFvf3xVTaL34aQLYhrXKsMg5SrMpe2eQ4qk2y
	yX0ZCZ0gV0RLmcSEtyRQmTRrzwzdWy8nGwksNwx61gBiCu4e3sWPRO7LwS8QJzHS4xHAm3MvIaa
	/M07/nqIon8I/pLtghW6IBP8Okf3QJdyWJTOZ/rGkmgICJ2IR/XapajFMwybezjVFyHpVEj/jFB
	LsYnPcVkAnB6rE+qBX6xQ3jlNE4YVowdSIk93L/ArHR6OTdt6ZCj5r77BuQLGRVj0L0D4=
X-Received: by 2002:a5d:5d08:0:b0:43b:60f7:2283 with SMTP id ffacd0b85a97d-43d292af08fmr23457243f8f.22.1775566419646;
        Tue, 07 Apr 2026 05:53:39 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a7223sm45923267f8f.5.2026.04.07.05.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:53:39 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: airlied@gmail.com,
	brgl@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jagan@edgeble.ai,
	javierm@redhat.com,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	megi@xff.cz,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	yangcong5@huaqin.corp-partner.google.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH 19/19] gpio: add GPIO controller found on Waveshare DSI TOUCH panels
Date: Tue,  7 Apr 2026 14:53:36 +0200
Message-ID: <20260407125336.282320-1-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401-waveshare-dsi-touch-v1-19-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-19-5e9119b5a014@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 01 Apr 2026 10:26:38 +0300 Dmitry Baryshkov wrote:
>From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>The Waveshare DSI TOUCH family of panels has separate on-board GPIO
>controller, which controls power supplies to the panel and the touch
>screen and provides reset pins for both the panel and the touchscreen.
>Also it provides a simple PWM controller for panel backlight. Add
>support for this GPIO controller.
>
>Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
