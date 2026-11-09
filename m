Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203244;
	b=rS6p7TJisUx3gB2e/C3tcW0uk9De11p/9MjQogfAoR8xRMzvZi7wh5maD4msO0skIzcg
	 i6FY3Z6QTKG86gr3YC8PuHI9gXuFAGC2TOqud8Am9VNwylPzlOhXnxsAPnAdhs8ZXpVWL
	 QwnkfGhOYHRTkid9b9ysDS37yY6ZcAncREW2AUWSEy9j4Noy/7AlyKRIsdG6rwqPmUK43
	 ijLevo5Sy9Y21WchaH3El4WYtYh6Vwtqin+wx2q46O7Psk9RS0Irim3DQZDor8jXifAyc
	 5KSdBl8Iv1uT/j9QWQf89NymeokSJBbAtEb1kgOB60vJ5DVdZdUr9ysfdesMDYe0GYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=byaI0cUQu2T0+QBNSGRsOncWnFfV4y3lh2H71TsBHYg=;
	b=iJ4qFstLw56lVMFEHdj9acVl19EtBg1gynQ4kYK49mOZIFiUUAMPWm09BdtJToawRy1O
	 56YrhqyL66AZBNyeqj0hnUX2ncSUcPd1coc7acth1sfK793ZnTs7tZdY4PITQrPKh21qv
	 sS79fgOLra7J2sko/YM8jj6qJu8FVDoHabocLJRCSZZdZJd4dgofMQuA74TSTxvOsJb5O
	 fP6iyMNfvonMLfrhQmL2nVVJ7TnYeGTY7/GVX47r8gV39idZHL9CHS2WPQCMTwm/hTaJO
	 Dl5XzBgAFVD84Cki+tqnBeoqLJ+iIcWKX8pNNUuNA2JrliOG96mMxTL5mrHW/k4fJpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06dYORPp;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E154606A321
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 05:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E154606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06dYORPp
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so7149995e9.3
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 21:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203242; x=1794808042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=byaI0cUQu2T0+QBNSGRsOncWnFfV4y3lh2H71TsBHYg=;
        b=06dYORPpzojU2j2eWqVP4SeEMOaYCTvlFbcfvSI2ITWvvxv1I/yXkxZQXoZ4VWAZxj
         xkkiVGsuZiE3KkukRPUwYlYbmaSWqi9S0WH7ucuIMsRY42DNbFP+E/+uFpUSNHOertRC
         oDq/DdqmYyTDvpZk0nnlrk2u5wIPKiDJlcBm7CcF1wTPtXqJpef16AQpu9tMIXBUcO53
         TdN/QbM5CWzBaCSV/FMJWYYYxpVLbmvzcdL0hS94Ho8X0hLUNMGNl/31Rq1yWBqvuLcM
         Mq7llBlAclB0TuNmx+QE4BRFloNgcdoAARTfIZM05QBOZyDBJOUWZzCZ5j5FXKqkZ7Gl
         Wz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203242; x=1794808042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=byaI0cUQu2T0+QBNSGRsOncWnFfV4y3lh2H71TsBHYg=;
        b=z0AF3IjmzHRIjiV/yQKXPCEiu/BTFBbgkJlQxDDRB1+8zn2iqxS3+ljuJ59bMVlM6B
         iuxj9oPJ2omcwWvV0Nz4ltzp7erlu83EvO4pNUKNIbZ8G6kxx6uJE8SQMhqAZRQJXWNG
         ScgJXDSV1ZpDomYwrJa9MJHo89xYLHpYl5U/p6zBkyY3CgUn9kmaJlX0MTUMdkT8xDmZ
         Gv2kVBXLtTz1rb7o9YpGR0vd30T73zIquWm20iCmoXRagKtLuxGem/WvVkLZsWKTJ2uc
         vOeSdBBPSgrfI1m+TrLVwiG0WwOl+anNYdhykV4v8uhUXUC9aou9Z5A/UB0kg8jPYCFc
         glRg==
X-Forwarded-Encrypted: i=1; AL+hErG7LoGpo+XN1+Cii55l9tjb12tExxhtKpEQq8QWUTb/z7fXeAYFJN3PrKYZ1njR6jSRP3QN5JlkF2XL@vger.kernel.org
X-Gm-Message-State: APuU4Z91rW+Em9CsX89bbaH4ZXiR/wV9j1NmS9trJsrkuPxZCm+m2tjp
	Sf0e98VH2LRtIA9Mf4dHrKurXF4Kj0sVD84KM4e4OykByQgPYbGNA6PH
X-Gm-Gg: AYBFou3Tqzz806by+f8rimamr44XJ8CotS8+2qc+msJ5MSN6iO8gzmu5lrVMAVcKdZy
	CmNdusP6Q9gAkWTB5JYISYNU0TnKxRTEFRuHz/RofDaVGAHI8xIj0ffIADqHA4m96JiaZT9w5p0
	WeL5D1m4xxNZds1a0UCtEBXQ6pV21Xn1nVQzFel1fgotBMW8sq1uCsx8wvOViNOlreJE8Wbkc0J
	BkJVItqRIPGPXJ1r6TABneuAC+lfAkhum30Or4P9yhLZKtuAYpZQOnDG8qi9BbrVOHExWrpx4Iy
	//H6PzXKWcn7o3JKOPovNU1RqOu6+N+4UkXJ7WQDRHrzIgeh1Yw64lKh0upeRy+HkYW7ED8jhxk
	SOnYmXNJh2oxjWydHQKYWqIhZWQOGI7UxSjDPz3T4D5AIsi2SJ+7aDysp176RBk/isHV3I+GrH8
	B8T0GkYYGXSQjdqR1LyKzWgL4tdP8eFfx8w+6BcmbZAXuK+iwj5VTrnk0c95w/W7EbZ2+JXd55i
	QthZxC/wV7dCBTCc2vvke6/KnYX0gupCViCJB6smELirsbO5vyhQtEjgU2KUKpoT6HnmAubzIxf
	w4GiX7sCajPcpMSFk3mNkN0K8dy9f5/HRSrDt8WvR5IO/HjypLW1t6QCGqau4GXZJ1Pr8023WkF
	voXNU623vRf1oEEn20CB6i1QVoStfV1ZZRklFTUxgZvBsXV+eGrPV++aM7UWoZqHsNuz+ZF0Aem
	h7heYwiRO3wOU=
X-Received: by 2002:a05:600c:83c4:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4b963c6a8ebmr57095265e9.19.1794203241970;
        Sun, 08 Nov 2026 21:47:21 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79501bdedsm130008445e9.3.2026.11.08.21.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:47:21 -0800 (PST)
Date: Mon, 9 Nov 2026 08:47:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jiawen Liu <1298662399@qq.com>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Markus Elfring <Markus.Elfring@web.de>,
	kernel-janitors@vger.kernel.org,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: handle clk_prepare failure in probe
Message-ID: <avFeZWgJgID5XA43@stanley.mountain>
References: <tencent_B4F504456790E8BA3C4EAB80F4BFB6954E08@qq.com>
 <20260820154323.0a7c7929@kemnade.info>
 <tencent_A1BF4495D1F5E54524907BBA2A4ED480FC08@qq.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A1BF4495D1F5E54524907BBA2A4ED480FC08@qq.com>

Andreas is the expert in this context, not Markus.  His suggestion to
use devm_clk_get_prepared() was a good idea.  Add a Fixes tag but a
CC to stable is not required.

regards,
dan carpenter

