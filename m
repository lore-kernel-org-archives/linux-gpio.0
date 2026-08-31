Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574B853A8B1
	for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189823; cv=none; b=Fb71vpDjsRwNIufXD12AfrlKejZn12E/2F53OGRuxVWFn6u/ARemXOYiavRkOoi/HCroXXAXy2kvtrXFDznenpLb4eKF9scEijtaj6zxVXI1hwfy4eJ5Peny1haeFCSnR5IYe4ibhySStIKJxkB0vq+5DmNIGHQAXh6aeMd0hUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189823; c=relaxed/simple;
	bh=mevHerDxAKLPyGK7PyDjdO8JDnb7+zQTHedcYrahIco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gu+0hzVzvZPOfaRdWiZHk5pC1VkjElOcF5PGE5FTXJre132LleXrehHTlwTzKMQdPjaCMNtufl1VK2Ke6PjgghNryIS4An6Ltbp2T9jI3o+fZq+yyesItCINePaNByBS0FS81i30yn+fCU0ujBgnEzGIl2ZXjS2gMEhex4gDPgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puMYtJn6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puMYtJn6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48433f36a21so1424035f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189820; x=1788794620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TYoMZssjOXrC6IExZNNz+Kvm0ZtsijKwmBjJpQbsPjQ=;
        b=puMYtJn63nfZb45V47+O1kJ8YcQB6OSXw4V+rMO3LJOZQjDEyMQ9yHC5lKj/cmYitg
         kW/qqsZtGVTCo37Al1YZ2/EZljj678gDwIPXHykeGz1gWwgB3GBgljzVEptWDkAJ9FRX
         3RlO70QCcIfZH2G5uEwtkTYp4+Gbggc7AYKFGquUS74TQVxh3226chEw4MAZQ+tU2FkT
         /SAiIRH0ygM4VH8YoQE3rOr7U9P38pmvfV+asgYepBc/6jAy6pYN0P6lp4B6cXSUzJt2
         YaZn5tOJZQBFAdEgMmqe3EHUsrNnD+ppJamdr7/VxRD+cd2zbOJIgFpsAbfwkbzdGZuQ
         DavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189820; x=1788794620;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYoMZssjOXrC6IExZNNz+Kvm0ZtsijKwmBjJpQbsPjQ=;
        b=lSLNgMfIQvoXXDlzX2UXqLvTU5RoNvrdxzZRSk/0i+EDFfjrq3qA+E5E2ojG8eVqVE
         zJut+FHPnOwkSybQlpMuLHBMLi0K+2dCLWZVW96pELvip7BLFYqxq5BX/fOGYDJv8B2w
         5DSaUH463m/P7fbp5oQbekdDq/dBd+2SVutgLQwPD4VjQ2MQpCu+38cB+RVcCmGhm6z1
         fkNywKRLECGnQne2q6v74Vi+gYpWollxVkPZW456poPuLHYxOL0AuHuK2c/4SWs62naZ
         vFb+8w9dZafbZ9yV6pLFBslqCnkVxsjuVyzLz2zo4L+iM3gqNw4UlDCim5YeoMyCpNNB
         uInQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhcKF1K/WIrIzNqSDari8frEa+PLSskkG35VQAk55y2gS4qPWNiPC+UOQ0BMlG1ujhQmtlrDREEDi8@vger.kernel.org
X-Gm-Message-State: AFuF++kH7PAjsLc8eLuqUkaF+aomZVRUP51lMhpkh/bJgVm2GEz/W7oj
	L9KxqudeuEzZ7C97f2hA2zqaZZIJi1BkHBH+kUXbyOe7LogOtEvC4lcn
X-Gm-Gg: AR+sD11RLQ4I6Fvlr57oFKOu4POnx4NGnqC5jKn9+xhteZvF9JuHszJQ4WjRqIQBqPZ
	OEfa7yfZuLho/2RHxeg4gCd6pzAvqIDJ7217ZG589IYv45B7lwxTAqxKNZb32PtohReSGwygNIU
	Md8L4zITGvZBBTDZ6WE4AaUwKbbg6uh9pr80oRji6KMiNYCXMQ1u/PYfdWRIPO3+IwiXVyBmXjj
	9Mo2PLjabs8ktFVPgh+/0PQFBGHt4z8XbsZ9r499eHtPmL4FL6WSvBm9qpno1jwSZeFfW4sJDnM
	YKfRjNGdOeppVz7rLBuscelVMK9GEuVF0ivq/2CdwnKgjg1bYyplUYieCK22aKwlTXvQcn1RvJ2
	faNshJyJzEkX52EIoKi+FvbH29snHdjQlRgHBpewiSW7iu26Ki7ExABVStR0mS50aqtY2AcIU8e
	24s2zz4kWfOAhI46pEiqg2BF5vVvv496eC4F6X17fcInkgDUZjO702EnPqFnJwUZjwaw2s9N10P
	viTbiivJrhm/5hbDC09sKB/sbh0F2azZAc=
X-Received: by 2002:a05:600c:5d3:b0:49b:914a:94a2 with SMTP id 5b1f17b1804b1-49cd52f339dmr103342295e9.1.1788189820544;
        Mon, 31 Aug 2026 08:23:40 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2794dsm24234272f8f.25.2026.08.31.08.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:23:39 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Kent Gibson <warthog618@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 1/1] gpio: cdev: return EOPNOTSUPP when HTE is unavailable
Date: Mon, 31 Aug 2026 12:23:06 -0300
Message-ID: <20260831152306.166630-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831152306.166630-1-ivanrwcm25@gmail.com>
References: <20260831152306.166630-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Map hte_ts_get() -ENODEV to -EOPNOTSUPP so userspace sees the same
errno as when CONFIG_HTE is disabled or EVENT_CLOCK_HTE is unsupported.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 9f3b628d5793..6dc01f7ea838 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -715,6 +715,8 @@ static int hte_edge_setup(struct line *line, u64 eflags)
 			   line->desc);
 
 	ret = hte_ts_get(NULL, hdesc, 0);
+	if (ret == -ENODEV)
+		return -EOPNOTSUPP;
 	if (ret)
 		return ret;
 
-- 
2.43.0

