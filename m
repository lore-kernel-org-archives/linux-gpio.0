Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA2B4A2047
	for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186715; cv=none; b=Jeon9kUZEndJmzd5zp0TQSeVw8DpC13AP8pWLbTYr14cK/UgrpIEdEUHTCEKx64M/SNz0oWqJjlolnwAZzcS8znFITcAeRLPai+4V47gJ1rgQjeuzVQR8Qu90Sj0Pt3gc/T+3LcwfdvztW7nR3fc1Zq4jMDfu6IWa+A8Cdd9JKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186715; c=relaxed/simple;
	bh=ptU1ZlwnH6vGoRUuvyLN3kutz8OyEqpRWrw+X4HpfRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gfegO348jD2edUlySWv1nEbhiDatMaNyuT+CC2HpDB61qdkkQ9Ywhlf368DwHdaeQvrb9QlQWenCgFBGx3Cj8upDtx0PKLff3H/6gY0EcvIuaGUsQCeiQSr5cZyD6N9zjfH4M6qomPWKZaw3M2ZqEt16WWwBnYPLbTwtUPQIyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWWzjw5z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWWzjw5z"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso1201955e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186712; x=1788791512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0URnMyQaQtd5j8PK7iDRRW4R8eCuSdT+xJY+FbyXAg8=;
        b=FWWzjw5zdYa5hemg0Bz508VnkzSVUhgGO8Ud33ktqXwJ1yzmBZmVFH4pD8jqIx+Mro
         LHv8ds1c2BCOVZWQpE0z5MpR8wEKZ3NmLg9SZRGdCrKg3HJ0npHbjOSNX3GkVJz5V2o5
         yoKUMAe4Llps/svc1uOawDThQD8jiEtLesGMP0xkYOvaW27AEehLgN8S9JamztSLHjpa
         YhKll6vpaZFXjTagIidbocRnPB/u8shii+qanH73UDHdaYH9TdDYEfwwxwlbElHgbD8z
         Sd4GyjZR07kOUly9ppEu6F6RiuFw8Xj2Vxln+YrvlqJws9i4AQ4gr/BV0MSW+DSztHjI
         9eWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186712; x=1788791512;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0URnMyQaQtd5j8PK7iDRRW4R8eCuSdT+xJY+FbyXAg8=;
        b=Gnz/DoX0thlMoS6tLoqJv7zsbuWGpUcMmoWJoMYm1IcfYztG1vkv35gaeTLgbTWvtZ
         icmDPYYD0Qkhhof3FybcR3badxDF+lymvXfc+O0xXAB2XDSjtHFdKUjqWoD3SP7/rs0G
         4EzGgsmDSDiaO9N3k4WAjuHIUK5ymUvxv5D/nhN7tDnAFjB2qdzYskk+oy6jJqumHM9J
         GKqEDERn/jEF1K0r3ry9xnpA0Nnp0JFPrghVMY0xe7iKGyqrNbcthrATIeY+cG9UrSBN
         VSeKmwwhQR5CmppY50X6NDF4+4dD9jwO9f+5gB+/xH2PAPfQpDUrTCjmtXd5eYYOoMGX
         cumw==
X-Forwarded-Encrypted: i=1; AHgh+RrRZFCY6ZLbKuY8qDNW/ws+/5tz205Fl5avjTL2mIXD7jZvZpla3YSc4WzhxSJpGoTn/5vElagIEloL@vger.kernel.org
X-Gm-Message-State: AFuF++lq1T6HGi+J15gcekHR3ofbxSTGieVEgvaCpZAlQfmJyWYOx97E
	1GxulkfAH+4XKoCyqGoY2+yxQTLl/Z4KXkd9suqVCBNk7fuYkYVYDJn7/hBs4Ju1WuI=
X-Gm-Gg: AR+sD13IeDOed8PCbjqwmhDctCSozq0vB5ZfpCveSLL+Ws3n/jyHcwlZV4xIXAiZTU+
	csQIB05qjfdZ80XPDDaO2YyLuYFSUOKnMjVC8vUHjf/Erxt/s3UN8g1YziynDAI/0f63r38fF3G
	+hRrW534hQJA76A2SZZBHHDAPeCrtF5JMyg5uCwnnaGZaTc7ib16UgpKY5wroY6x2IfPp1gS3Ys
	CZGblObqKYE1QzMgqPGenozLbHsOM7YOPtHExj39S/Dk9Xug3mg5I52PwtkUsUn48rRni23MEeS
	YpK/G/8sbAVDnzbkhE7JSZN9bRHOB2MOk9t/wO859tY80aBSO0CLvPImRBc+NCd65khr+SkbiLm
	n7i9E2RYMa91hP1+GWrnWxwOsODlwr/waV9uV5VFSH7gMDPsIcj3Vnfdd2arbKKlzhLEIxvMiUy
	vmoAR9BCA7gb4O+GB0iHn/iDxO5jEHpLZQ2kKG/xOfnrCBkv2+39LMEMitCMNfAt7HM/ZkTmGjk
	l68vKQZpBAxW2rX20THGQYW
X-Received: by 2002:a05:600c:a4a:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49cdc567061mr21947265e9.13.1788186712229;
        Mon, 31 Aug 2026 07:31:52 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:31:50 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 1/7] docs: futex2: fix documented errno names for futex_waitv
Date: Mon, 31 Aug 2026 11:31:19 -0300
Message-ID: <20260831143125.151360-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The documentation cited -EAGAIN and -ETIMEOUT, but futex_waitv()
returns -EWOULDBLOCK on value mismatch and -ETIMEDOUT when the
timeout expires, per kernel/futex/waitwake.c.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 Documentation/userspace-api/futex2.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/futex2.rst b/Documentation/userspace-api/futex2.rst
index 9693f47a7e62..615616305c57 100644
--- a/Documentation/userspace-api/futex2.rst
+++ b/Documentation/userspace-api/futex2.rst
@@ -51,10 +51,10 @@ future extension.
 
 For each entry in ``waiters`` array, the current value at ``uaddr`` is compared
 to ``val``. If it's different, the syscall undo all the work done so far and
-return ``-EAGAIN``. If all tests and verifications succeeds, syscall waits until
+return ``-EWOULDBLOCK``. If all tests and verifications succeeds, syscall waits until
 one of the following happens:
 
-- The timeout expires, returning ``-ETIMEOUT``.
+- The timeout expires, returning ``-ETIMEDOUT``.
 - A signal was sent to the sleeping task, returning ``-ERESTARTSYS``.
 - Some futex at the list was woken, returning the index of some waked futex.
 
-- 
2.43.0

