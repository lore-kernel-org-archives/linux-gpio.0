Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437124;
	b=JMjfb/WIppknnkIjzWvgJZsSFns5YnSELFdO2dW3Goi3r5/pyCXoT+SuKfw7wE644P58
	 K5OSFFPfzY54WXoiNagBADkN7nDyc3E1Q4JRzyK8ANztzhupcISKOVvIqhA6thL3WYcg8
	 3oV5XrQlWVvmSk2KpnivoRhC+vkXHDgPiq3Ao+zLCIK7D3Wj+00Ji7xC42zWJEaLFW8XH
	 21RCfq6P3dlpCsvWAQDFhzEOsArbWjcpPzammBCZV+NMHOhSnTz4K6RqxJ073e221YgFV
	 nykooUgO0d+SOQ/i2wRZrb98eZv5f6hLvaME+CFspai5WV4EYIIjX5Tu0twpiur4xqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tz/unDvmUIAP361qcoBIRc2mzL7WeB7bGyJhoQbUhsQ=;
	b=AtMT+MEzJd6tbSXncog0QcXYXxCQNhRNqtJtejsC6GjcoV2Qps4jkrTcM63Wa+HW8wdl
	 h5TQFMmsCyLt+ouMwKAb+PLgKMtbmT1uyADsntmNFzMNP0qv8TZUxI6TkIKJg86OtqePp
	 uRpziZDIKH2aLDOdJuPTkTq+n8ZGQcqH2b5Up35CYpSZ+6DYaCOjToCiRuuR7YGQCvd4r
	 nRWytrbug1cM4GR5yiJx2IZbIP76+U1E5ifWrSM2Ruur7RE8wzeCoUAuWIOhFNDEkcxud
	 /r6+r08z866VTmUh/K2gcLP58nYHw2cDKXTKNd1KNGi9iHe/uLeDjmFGUbfNKI1YmRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hw404mTc;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6917C606A322
	for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2026 08:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6917C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hw404mTc
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so1062158a12.1
        for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2026 01:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793437124; x=1794041924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tz/unDvmUIAP361qcoBIRc2mzL7WeB7bGyJhoQbUhsQ=;
        b=Hw404mTc2MmmCOgLt/LfvHS23csGEPGuUGOCRsxPSp31bTOk7WeC4cudoS3MhaT1kR
         nsXDgxdfbZzL2vC+owWkx8HgcQqHitwbxVA1/EhOGWYTH5JNDo8/WqcqNFrY04IrQXqG
         +wa7eAwZXSOlt+N4cs4aNsnlUna0ouSvrcWUbW2njhnrQH4dyp/IRM13nKHZva21vR0H
         zYYgpsSEBwsSKF2q3df7JiZ3b3T7oBMtQNgpXTElLpIR6TGZYtfhRdtDAYw7bNQLic2C
         PyiAsXMypruVLFCum+pZA8rg3gJJbDsGqoSR0d0s0h4ExrLktaxdTtq3dyC4OALI4ZRt
         kvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437124; x=1794041924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tz/unDvmUIAP361qcoBIRc2mzL7WeB7bGyJhoQbUhsQ=;
        b=10tx+7gdLjqjHEaBAtryARthYdt3x3w9oSA5foVAsot3ZStdyvOdoPycj+22zmaGZs
         bTgcKmnv9ycLUboN0LLDWFaBl4S8t/bspzDHtGZBnRQ3Cnan10tSIeUKdnvXhCN1VPfK
         4iFBQaUVbuPsZPAiLFmEvp3AKgJZo0sAGHTU3EwRQL9dz83e+NoCaSbfOVLOwGQBRZgd
         +QV7Eh8Ve0/s4EKXUb0V4RgjV/SeKNLAZ1BsFkTQhlfh4gBUi/FTitZDGrk+NbRVjNh2
         dDnbCbXv4vt5WxCoe67Z3U+DgYNRSf9RPWnztzHSB3HNL7iSKssSp3SFsDpgSxha7sAP
         lgUA==
X-Forwarded-Encrypted: i=1; AKwUvBzs0lCYBVOGOYRnYiJT0EOb5i4mh0ToqLZSgSIv53m/9nHBaPD//ER4cKbhgViqL0xdtY5YiSG4iYSW@vger.kernel.org
X-Gm-Message-State: AFq9FYI0LGBoJiG+XKOEkslliNSYDGqXArLFE6bhqhWwrdjK4w2KXsyH
	iFNZgHxApjeLbVL650W4ZtbR3vYy1i4GGvB4NIicUvhKK6v9w3CQNL6Qivjh1Q==
X-Gm-Gg: AYBFou3Lv5BURuY0QQQq0pncoi0YeDGmcWM6M6nfqSw/yG+WthbLpBaU+c8V7ENpujc
	X/cB8gig3IwhmzH+hrmgFlsooaBXrODXbe9M4vvExAo6wf2vIrYkPkTGOca6colXPqZLWpkK157
	rUK1TeGx/xSEHej8PPTICYjjRQIii/XVZksylvcXEX+kgZY17KqVd3TauE6WD5MRW5cde1r1Ryf
	c3/bX85rdh84oQwaIEu5lFb9F/aQova0iXPB7tOJTyD76yAMrm29lUO9k+OW6siiMD5p707LkyO
	XNopBO+UGai4PT2FVchv1d7yFSsSiCrUtbN5QYMsBMNAIiQDLQTRyFK3jYh91TdCJM0ho6oOr8M
	vVWdbDeXc9mT5Ng5bkwGnAAzQMYHkjGHt0muW5HdxEnGv8c6QwvO7HJQzmDL5deWTGgcprfdXaj
	5NVu4EbsRSyFlLBfvbnTYiNSuKPdawK0pdG9w4s8mo2fpfJfA7OAEXZHBy7hGO/fngyDccu03N6
	0DOQuxUBZU5aVvfUWOHbhtHOpRYItnKwukbbGcEfAdCX8KAkzSXfeD4bWXSkPCAveEWba26osDq
	581+SNwBAc0S3t2TTTgupSGrDLZ4nMNaffE+vyvr7nbOlUEKVuW9CDdcXPp0CHbFKdcQqnPG8cy
	ZwbP8/Mj2GFM2W7YITOTbEbDBNmT5qjwj32hmQZP+zuvyKS94PpaQa1vg5hmwUGU1ZkvBO5vzSi
	GUGqVmev6kgBsASkoN8l9eGslk
X-Received: by 2002:a17:90b:4c85:b0:3a4:b418:94ce with SMTP id 98e67ed59e1d1-3ae89574db4mr3528996a91.1.1793437123597;
        Sat, 31 Oct 2026 01:58:43 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84580a0esm6880513a91.8.2026.10.31.01.58.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 01:58:42 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Koichiro Den <koichiro.den@canonical.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: sim: fix the configfs lockup racing with mkdir/rmdir
Date: Sat, 31 Oct 2026 18:49:43 +1000
Message-ID: <20261031084943.23107-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAMRc=MfuDQ9=bPYsxeEiRaLzC0Q+hVxjTov_JEGv_hsARM3U7g@mail.gmail.com>
References: <20261026060049.60599-1-yuz08559@gmail.com> <20261027085653.90471-1-yuz08559@gmail.com> <CAMRc=MfuDQ9=bPYsxeEiRaLzC0Q+hVxjTov_JEGv_hsARM3U7g@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 28, 2026 at 03:07:55AM -0700, Bartosz Golaszewski wrote:
> Is this in any way linked to your other patch[1] for gpio-sim? If so, and if
> this one is in response to sashiko reviews, please indicate it by keeping the
> series versioning, even if you changed the approach, otherwise, I can't know
> if the other one should be dropped or not?

Yes, v2 replaces [1], please drop it. Sashiko was right that v1 still
raced with mkdir/rmdir (it depended on the entries after dropping
dev->lock), so I redid the fix and changed the subject, but forgot to
put a changelog under the ---. Sorry about that.

> Maybe:
> 		num += list_count_nodes(&bank->line_list)

Done in v3, with the full history under the ---.

Thanks,
Yu
