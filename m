Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE42EC081
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 22:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982912; cv=none; b=Yivn4gUM/EZ+2wUgbxmVun/sH0iSyKv6MbVqrau0NCwm8LumrlOPPMMEUGqFFgTewzz28A/qJdtqbzR2PfEAG7ZHpgByW5h4OLOIs2tYfjSDPjd2qRvx1OpMhBHylJh/23J6FmjoGO1PyVXuBfokAhIDME+4OCXBZXls3fGvBvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982912; c=relaxed/simple;
	bh=Rr5fC3OlvLpQPdfWMH+2s/akHuGKMp9V2igyEWO0gQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtlAFs4n+Q16Fi7m2MGyWQP8MgATS0IC52D4yRTT8olJmyGlWnMDnhIggLXJMdLMN28NS3ap7CpQSlepseA1ck+00mU1aZuBbWnkZ3JSSLvUTjMriQtPiKEM4K6XsEUrsvaBtd6dkNiTCCQ8dTstbn6kLFFx4JZGxQYMtoGkZFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtwhQVeY; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtwhQVeY"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-42fc6923f38so1205388fac.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 15:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776982910; x=1777587710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdya5LKZ9ajOlrGY+kF56RDY9LS4ty8P8nqmFYxr6hU=;
        b=ZtwhQVeYvWlkisOKjJnDjRwK5vhyepLEiNp0zkJ0WtXnWxSYBPhanzHDWHDt/V+ls+
         yoV6JYGnWrs8QVL6o4zhZ+Eymwvkz20lkk7ymbAeenY64cmsHAYetYL+Ha4MtYa8rlFv
         hjhQQJbEzFJaOBr00cDa3JBs/X7Crr3QtnvkHWNBcxE1UzTdt88Rz5dYcuJUYNkdf/IU
         EQhhLiFQcE05vA10Ebn1dME0+7sOvzpeD7p5W3jJlVKR5XiNs6bYQi3xe0ic3I1stz0x
         ZqiZ0kH/on4aSWHZWhzcuhov0zoOdEfZBNPNhuomNMoGaqLL4EjLbaX2zxig3x1hIDVs
         lmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776982910; x=1777587710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mdya5LKZ9ajOlrGY+kF56RDY9LS4ty8P8nqmFYxr6hU=;
        b=eLyjS7c/dNiZA3yP5yIER9wN6Sirk4tlZkadQ2W32TJku9CFRZXj3VrAhC9lnHHfy6
         gQBMtiszZmmRwKRT/8Kv0QskPztX637mMo3LEQETlSz0vcODcYzDigYx0ihMhMpi+WOB
         9CPASypRvD6MMwCHJVbOPWaekJpMceDI0AptMqUY5UbtfHGOHLIlo9dq/NHQDbMCWzNE
         lmHZbZ+11TDHgz9nm84BBAiJcrH726fLBYjq7Nls/GdLQaKV788SViF+CBPHcIlGVgoj
         hJCvAoxCqkb69ljGKKYx5fOCb7iC3gxMt4HzCvj0VXqzRS4MXwxCynXeO8SAde8+ooPP
         e8rA==
X-Gm-Message-State: AOJu0YwVFtZ62IZ2diutsddr9vXVs8NyaHqnbMzAVq1m2cc4a7au231G
	gWv0e+PZU80RVgKZiSdns6yNtBnljgMOFwvaBtL/xHgYmFT7hXkkk/EgNEkeNw==
X-Gm-Gg: AeBDievhN6Aq4TBL7oIi7e9Z9M/JjQxHWsxM6DAlJNHD87Op0EzdCMFRTqimP/QuyUg
	EyfY2+jQZjMwfuUkDXdIs47o1MPEJALlcx2ovgW0L4yp6A1X4recm7NXOamlj47HKPRGW/gunKF
	lpUbCLdykVP80FGxiPZDqEvlemztppO1cyZqd+3+mn0JMPf/d1gz9Z0BNKNW42Kk9gYuYXVFZOW
	iBi6QZpJyTW7CzwyicV4NvN84vENIyVDm3lnWqIAfcXBnlpPPQtJbT3cVqYZa1oB9jLDF9gRsxG
	aAq/pHeKN312z/Hm+uL6Hj/uN80yk4g7YJ/vJi0lXwW1EMbY1+dxIeHJ/Als8gMSzQyJ0PaRx+o
	Zzia6TRoDxZ8XXf06bCar5KAALWGP8cnegqFWNjCRzi9FW3Cgk8Fi81hwCYdkDYRAqXvlj54SC4
	ZayQWmNoSIz4FsI6cDUcYBgm0oJx7T2EEtIylGaeqES4Zgm04l2KYPp6dIDEJZ3rTOZ/rib6Wn
X-Received: by 2002:a05:6870:aa08:b0:41c:af81:2e7f with SMTP id 586e51a60fabf-42a99a90d08mr15755425fac.20.1776982909991;
        Thu, 23 Apr 2026 15:21:49 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930afa63sm17784598fac.5.2026.04.23.15.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:21:49 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 3/8] bindings: python: simplify disallowing _ext.Request from being created
Date: Thu, 23 Apr 2026 17:21:20 -0500
Message-ID: <20260423222125.29097-4-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423222125.29097-1-vfazio@gmail.com>
References: <20260423222125.29097-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, tp_new and tp_init functions were defined for Request with
the tp_init function raising a NotImplementedError to prevent the object
from being initialized (__init__, the stage after __new__).

Similar results can be achieved by removing the tp_new and tp_init
functions which raise a slightly different error:

  TypeError: cannot create 'gpiod._ext.Request' instances

As this is an internal only detail, there should be impact to users.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/ext/request.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index 1e1f65a..9940382 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -12,16 +12,6 @@ typedef struct {
 	struct gpiod_edge_event_buffer *buffer;
 } request_object;
 
-static int request_init(PyObject *Py_UNUSED(ignored0),
-			PyObject *Py_UNUSED(ignored1),
-			PyObject *Py_UNUSED(ignored2))
-{
-	PyErr_SetString(PyExc_NotImplementedError,
-			"_ext.LineRequest cannot be instantiated");
-
-	return -1;
-}
-
 static void internal_request_release(request_object *self)
 {
 	if (self->request){
@@ -390,8 +380,6 @@ PyTypeObject request_type = {
 	.tp_name = "gpiod._ext.Request",
 	.tp_basicsize = sizeof(request_object),
 	.tp_flags = Py_TPFLAGS_DEFAULT,
-	.tp_new = PyType_GenericNew,
-	.tp_init = (initproc)request_init,
 	.tp_finalize = (destructor)request_finalize,
 	.tp_dealloc = (destructor)Py_gpiod_dealloc,
 	.tp_getset = request_getset,
-- 
2.43.0

