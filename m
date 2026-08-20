Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5638E416872
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224359; cv=none; b=FiAsIw2KNEC97r8q0CK4hsS//dCGdxfFbpMI1E/ZN4kLzUgqes63tVA/8LRay/jN3dR70GH/xp4V8hrYmiXquKgy4Q08nONnEqhrLpA+5/3MVteNxDwiVHjx+tO5/dJTWt3fUW+f0C0FXlaVUJfME/2dYOndvhNgKyuVbzXtIow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224359; c=relaxed/simple;
	bh=bpThVqQFygTLCaGsuEqWcCStUhPTHs+dDZkeeWLg/GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mb+ztbGWWf5hWmY3TYHzmrzYeKWgrfWsc6FjTVu37/XI+fK1mW4lGeW2qngoChy63s6lJiNW1IGEgXCyn0PCSIDABBx7FyBOnkkygZoVdlVZlAAZF4KkDXeGLOM+F9gU0zjKKnZEGm0CWTO8bZZutyUurGFyOUeBuLvlOnDWbkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzmREX25; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzmREX25"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1356363f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224356; x=1787829156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/CXQAuep88nNofsLR3pz9Vsltdh0mP0euDeTnwsECQ=;
        b=fzmREX25AF8DFmChWAmwjnrUmKLr8jzWJlea2/XkY9bhSMBGnVXTsTPxEa7Ys9YdK3
         E5QVkvIEm8Ti5LSYS/O6Bm+ceeRRIX3a9v4pdWwveJybgpq/Es7ifagoZFuY4uJUhrZs
         +TjsHbClGwvwHaPgispAvQYaoFZuu4PRQLLcIeWLZeYWVSmv0F1eEnK1NI/429chMAzv
         Kxhib8pYgxcf3DYTdgt/HF+ejtd5jr7WyzePB0JMHu4FhOfSGd/fztaiiCSkLAzaY5uI
         j9imtKtB8DfRzbE0LzmQSZh3QBdIqzXjOU6D07oSLBxDVHyfkAREcUeJYE/43o1aBWZm
         qEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224356; x=1787829156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/CXQAuep88nNofsLR3pz9Vsltdh0mP0euDeTnwsECQ=;
        b=XC0TUwZSGajuDwHv3Xi8X6MtdvUDqRlmgswczN9POl9c6gSpAbUDYxSzQWggcYJT69
         ppppYQ+gG8lm7e14rKUwV0rv45jgl97LsZReOxe1dEQQ99c/AfFIXtZL8jbH7Yd3zhy1
         wOA3TesKMRcdS/ywNKgGGTcjcE78wd6eoI8oFOEQbY06osqN0kN+jUwnCDBnjh1w5exM
         gODTJuIWvjeNDGMsPm+y9JGLMmDdzLERTZ4tg/vBZ6fdnC3oEIShZvUch4hzMQ/Rx/Sa
         WQ59h4S4GmKMWu8Rr4Swsgwrp0bjQvYBkXtiYJ6r04tIa/ByjCFQXa0N8ZNyYKZ4TYR0
         xbgg==
X-Forwarded-Encrypted: i=1; AHgh+RoMq1vZUr5UzFMEXI4CcbHqgqFn2HWaag4x04Zh/QGlIZ9LxeEBerCMRxJa4ahhX/VpESg+48Mus1Hp@vger.kernel.org
X-Gm-Message-State: AFuF++njCSyaWZTrpYR62zlBiTkOsJpANGB4+GIrzuZ764BiaDBcUBMK
	vcRmZrKDsiobO86FLQV7+9bkAiuQgdy9K6HsM93HRrCDoh8ZPfXBOeK/
X-Gm-Gg: AR+sD12+AW0UUSUC1y4wy7NYGVMUt288un96s2Wwq5txpQEQQMvi2dCstkKxMCQQkQo
	45dGdWJbCHGd29CxR3tJoSfj0jXfhqZk9N8UoBH1WgcZdn4CFH6Ulap2RvNn3V2DWWBl7SZk5kg
	ljZ4DB10lSUNXYkkvdD5gTxE4pCUtV8hY+pM1UDbIssu2tBOY075iYgbqs/UAoMjKic1fiA5JiK
	bNsY5r5VJSMWqVUEy7Mh3Qu3XjShuLvZvfOml4q/24KEmJKjZ/g5cTqdW9ijB47208J1nrbdQ6i
	g+HeFOfJqbbHxaWptwKT0gu5y3vrK6ANwh+g9yJYI9pq44uh2jlX6NSz6Eu6tftL5Qgei9vJ5Vn
	rdvJwDqYDECyLtoF6DQ4z/4HfU/9iyd4s9xkERvC+0c0EygHcJTjzhrdP7eIO2u6o4X1L93lJej
	cu+QuC5qFT2CiQlKznhg7iLVHtCcE5pJ8txVAr0HmCX502udScyX8U8vAW26zW9uhPppkl+Jdj1
	6y4
X-Received: by 2002:a05:6000:4b0e:b0:47f:86af:8fdd with SMTP id ffacd0b85a97d-482b1e86146mr22132999f8f.3.1787224356366;
        Thu, 20 Aug 2026 04:12:36 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d23sm13037801f8f.22.2026.08.20.04.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:12:35 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mehmet Fide <mehmet.fide@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: return quietly from gpiod_get_direction() without .get_direction()
Date: Thu, 20 Aug 2026 13:12:34 +0200
Message-ID: <20260820111234.1085436-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813193715.2346477-1-mehmet.fide@gmail.com>
References: <20260813193715.2346477-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

A gentle ping on this one, sent a week ago and I have not seen a reply:

  https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

To recap: gpiod_get_direction() warns when a chip has no .get_direction(),
which is a legitimate thing for a chip to lack. On vf610 the direction is
not in the GPIO block at all, it is a bit of the pinmux pad register, so
the driver cannot implement the callback and every caller that asks for a
direction produces a WARN.

Happy to respin or take a different approach if you would rather solve it
elsewhere.

Best regards,
Mehmet Fide
