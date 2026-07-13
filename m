Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D6C396D2E
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 23:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985361; cv=none; b=K9xSnYKxUsXraddqwNkzPHvdwXUuKzYxtaWH3gYQhE2MBQu4mw+qgKvxxVR7Y71s638QG9/HGHwRsvrgmQnxryn9TYBSaNTdENH05Leo7EbGWtAU143oRInDkb7I82MxT7sLKhEzsBxCnnvpUYVcoeuIkbtEy1R7Pk/zAC398sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985361; c=relaxed/simple;
	bh=82WrTvzK6rnWNGMLZZKDDFGDlChYJxXWkSWFy4qOjjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ie9iyFukUmLDo4vYvhJgkveqz5RPdX+fLJZuCqkGMdcMy/6PYLVnYoddaK+ug+cJNV7q19HQVmqrBhTMVTSC74VCjsjFXflEwooptXKAzN9nkLeHzDeqe9lcB8OYIRDsX6JW6vfQi0XKdaQ+n2yUv/h4Wkudp7ovIk+ePfeyf0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+XtzHy1; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+XtzHy1"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso975318a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 16:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783985360; x=1784590160; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TRRmpqnsdCpySSH8C/9M0IgSzcJPTMpM/OkZS2qiqE=;
        b=F+XtzHy1hLLPnpLLDHzFdPX8sR2W7hS77YbgKNRQYwsPBseXJ5zCBDPpzeY46/zJl9
         CBMNhuMkJ2ufSBeqElDxmiYn2ZQVxD8iK6F+GldDQu3dlMxzVFycfzIvxlom1lwn+952
         pb8K+J4hewGT+svX21XQqlGwN8YsFxKJH/6uUnM4naQkdGqkqvUzCy+8PztRhX3HON5N
         1lxmhU0zKxBSn6YAjgzmP8XiFxSOzsK0xh9VPthmuzlPF4C9Y4mSiEpdroqIbVpG/OuA
         1AUnacT3iQ/h759yFNJ9Iu9uunRi8uSKDcpSnHYcsnfjMLHWhEFjjcF/ophKyaeGzzrZ
         h19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783985360; x=1784590160;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TRRmpqnsdCpySSH8C/9M0IgSzcJPTMpM/OkZS2qiqE=;
        b=FvOvHk0IoybWmMTYX6DxeGQ+n2SnZp/GUMkv0esJVdBCHHmOWvbk4+Mwz0mW3HVqtR
         BhD/8vlf22ALTjaGfvOSDXugwbr98fkVcStUO+NYTrd4kPRFJUsdAcLnO+NYX95YvHME
         mFm/MUSS1KwHNlEflOoxB2v5abgzDg/cJV3Zw4MSx4FFmYcgUrpPY6RfZl25L1HCy0Oo
         Dt+drKthGloaHkhjlCSqQKuL1AG1tJmFmVQOQEx90RxqcIwyLw7z9iZZ1wpwWl4sUStU
         F6ZH4f1GRygwLrdB1most/ZGiA1J6U6CjWIy3IAOaIIn8ujJYZwFXSPzjpsH5JMyg0iS
         uslA==
X-Forwarded-Encrypted: i=1; AHgh+RpApNRUfDfYvLIGqKpmaQypO4AQPG81kYPeMjy14UF1IcC37WK2SoLV4N2F0kQJc28OjwJRXdqSl3Of@vger.kernel.org
X-Gm-Message-State: AOJu0YxrlqzwZyXFUeal+veKpJ95wrauJRrxR59PDKA4mDelqaH4fHQb
	osUeSSEW7Lm1xFQpvf6FhaeCzEMlEUIDFX3RNopbI65bLBjcnAyuVdLw
X-Gm-Gg: AfdE7cnFkxkbZitujohfJahNcFun9/M+dh0zmjiNveFfslwGhYLiBUxRZsxKHkujKrU
	QC108tIwqGEIZT9S8O9rzXqngiUiYifhAz+s01vfeF71AkA3F5ZBrCKL8y5SuqlUf2+nfTbp1iy
	AttXcHQIBCWDqqR/AvJMgOJTEc0ZY3ODA9WDOae1GtpcwnvgLiQAB1OWL/iqU6E1drK0bdtrK0q
	/j0ijfM/CfHCiZylBCzD9sC1qR15nz5SUePPhz9gTwluGnCFSX8mmTz3y5zgC0KwaKxJOGB5CHt
	KBkF9gk4rsSJAefMwVyI+Fzn83qaHZcAVtQL7elcETK7zfBboSxlIoT2B3dmdY3wb9pVTaX3pXF
	Yv8lqxTjqM+SQjFi7G3pe8qV6PMcdcgRC23uwrzf5ueeQX0oC1vpx9MUnddznGB5bALQNLJV7QF
	WIQVs8i6IdpIQZXk63qsF0G/16DtUBBOiiAhapNeVS10kqB4/jTbQs1A==
X-Received: by 2002:a05:6a21:e083:b0:3bf:7fa5:8922 with SMTP id adf61e73a8af0-3c1100092dfmr11320261637.2.1783985359646;
        Mon, 13 Jul 2026 16:29:19 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e15f:5d5f:580b:f2e9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b84d6ce15sm33375141c88.5.2026.07.13.16.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:29:19 -0700 (PDT)
Date: Mon, 13 Jul 2026 16:29:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: remove trailing comma from sentinel in
 GPIO_LOOKUP_SINGLE
Message-ID: <alV0wIgZAY_InGYV@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The GPIO_LOOKUP_SINGLE macro defines a lookup table with a single entry
followed by an empty sentinel entry. The sentinel entry has a trailing
comma which is unnecessary. Remove it.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/gpio/machine.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index 5eb88f5d0630..1a141056716f 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -54,7 +54,7 @@ static struct gpiod_lookup_table _name = {				\
 	.dev_id = _dev_id,						\
 	.table = {							\
 		GPIO_LOOKUP(_key, _chip_hwnum, _con_id, _flags),	\
-		{},							\
+		{ }							\
 	},								\
 }
 
-- 
2.55.0.795.g602f6c329a-goog


-- 
Dmitry
