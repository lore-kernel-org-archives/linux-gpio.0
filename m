Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F363B4EAD
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566387; cv=none; b=WGYH0UuB8i8svP5B4CGgBcDz5jLe+lHANySVkh6X/vtPklDxgAQX/nHQEgqvFstUkbHjRRW9VC19HUCi+LUVKLZJQFeVMG/XqIV8KHAYtFZbUWoIVJYUKtqFHmVXRj48nsFgFgAuOBhQlPQKs2YBUPZPzmQ94qAeODKTdE9cJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566387; c=relaxed/simple;
	bh=RCVkgvU8wrx3yykBBPWnaa5epvqaL9BLmZRlWagspkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rH3O7hjxNoRGC32nvldyYcicNmppp2suh43aJQ3WKxlGXR/imGLcdGZAISFLJD6xX/MzqofETk2iIl9uNlB9fVc7w8Lh9vP8Vy2WmMQvFnlD1AOOBSgV8izB4d+uzIVFBXECjxt+ChChr0qCvedrUyfxKNznu8n/hShlxNGy+mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=d/FZ3aNp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="d/FZ3aNp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488c2690057so2717485e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1775566385; x=1776171185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCVkgvU8wrx3yykBBPWnaa5epvqaL9BLmZRlWagspkE=;
        b=d/FZ3aNpC+XX3+Rbje4+YmHFtabaLJoWU3mDTH6xVcUkdpx8mBezPCqXMxNBhOTL82
         R4BKy0jctzuogYHww07q98WOsPYEk6/YcwSu1a8y1V42Pzpul+36qN4qPsZqcQeKpVZV
         0wstGgsoYIGzd5DTjBWByQXzYz897Tgnwy8Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566385; x=1776171185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RCVkgvU8wrx3yykBBPWnaa5epvqaL9BLmZRlWagspkE=;
        b=VwI9zQGbolW8GgVQNERIlfQgacE572U+j4WasEhTc7o0Y0oWhvG90sKZS7he19vfDe
         PvHIN/dzEZVTzhuctXsYinG2QfzdZf/fWG2iAREuVo35M61j6pj8bLNPAEbpa+2r4pbo
         oPfy4dCQVgjSbgxME9hhIVQ8GQfHBwMTW6JCtek+u490lL8IqT7BFAndUU5SAoOnVa6c
         GoTHTd+Lps/Fm0k5qzg2nr1IELMNT1icP4PuTzq1SEeYYEtA8Lz2vcpkNurxKCzosKZz
         WWcYHcaXLWMXk5Bp6YENhdRY/x0mH60YUHRY5ZwhBhaTrjfN/DDOcynsNK05RA8sVdCj
         dLzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB6GGMldbaJqwke3whaANoABfXYxZ6ccmckztdvLSL9FgUtzRqbbFyci9Vnb3KzzelTMY96ZakndSa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy13ldSVzdaWmTukLiqPhJpJsjJ7GC+FeTf1CGf9UxzuBHa2wGg
	HrNiPD/+uFdijsYi91qD0am9sQe1GWGwV4GWgD0cmAOv2UBc+VBgjrugi2NiTWoOQDM=
X-Gm-Gg: AeBDiesi/go0YsTSsdKBaS1o8uIvtAj+xYYW+9A3aMDUH0ndGU/Q2HZL1RXjffqdT/h
	yWHhzwlJN/emwBMT/H6Xqpu+X800uvenr8Ew5USF4nU2AwtbXnPMbUUOt4wY3xP972rSAAtgX6j
	ZW6S87BOseP4mtfIuIFGp2/gvWbmBFHdFhTlifbKoDL95yUCRhgRch12oRiw9OrDYnY0CifDM6H
	t3KywC4AAh2K3bAele7Hd9JNEQ+5RzscsMV6GbljpcGD2NukfmuQnT1EcWosxQPgTZKTaXDjCfK
	Xv1Ay1CLjQLhHgma375uqK/GKdD4/55Lz+uHjjdYHLKE+0SuTKdYEJlbiQur5gBgLDcRLbTwaNu
	6kcVez+lNv+fNaSMhseTKMcxl8iK9I88dSUOUyBJDwXfq6P5Z/gDkheaRaUzIHM/ZcJ1lR2R6Fq
	Vd6JaofKuJinXDW7dJipDMM1B2NfMU0tG76pQ0+8YNw6xXqYcnqVAf7wr/t6F2HzuHY7A=
X-Received: by 2002:a05:600c:c8d:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-48899794fe6mr225654285e9.19.1775566384726;
        Tue, 07 Apr 2026 05:53:04 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a8ddfde7sm416273855e9.5.2026.04.07.05.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:53:04 -0700 (PDT)
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
Subject: Re: [PATCH 14/19] drm/panel: jadard-jd9365da-h3: support Waveshare DSI panels
Date: Tue,  7 Apr 2026 14:53:01 +0200
Message-ID: <20260407125301.282253-1-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401-waveshare-dsi-touch-v1-14-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-14-5e9119b5a014@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 01 Apr 2026 10:26:33 +0300 Dmitry Baryshkov wrote:
>From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>Add configuration for Waveshare DSI panels using JD9365 controller.
>
>Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
