Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726133750A7
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737343; cv=none; b=Lx/n62XZd0cq+S3aTmAvQ8Hz05rXat1iVmwbkPUaY2a1ztU4XVACHuEX0iao2Cka/hPoXXYVHDg1SbwIaxQAyZyw+OH6OpibE2ir8ntkyzLtucic8S0QebJZgSR3yj34owyWnTqaG3NIp2z5xIv/lS/HoSthJBOMWsOmZw4vOZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737343; c=relaxed/simple;
	bh=B1SonV887716oesm2yPOqphPLINTjebEH4V7kipGne8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7/Nh7LG+2hUyzTYlNaZ1PI3xKfl5wJkugnKMD4FJnSnND5kcOJMjBkoBTphFGXbEfogGz/+miGSxL2vnF+xDGWG1dWSiFyksJQNm0ai91mQHOz4NdVVSawYmNakE0Y0fd+ALKXGunBeP1gBUq75tSMOLSlKGwlPnmJzoGt+1Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MonJMQ1r; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MonJMQ1r"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ae3a2f6007so44771005ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773737342; x=1774342142; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xjrnRLDXHBwFdgbFPJ5wbch9uelKKkj5QYsOf+XR6ck=;
        b=MonJMQ1rGGAO1N5gHec9yyPqafRpiGkzR4ajFnyTGi+JFjUmhwQ2yMqW6k1oPmOk8i
         Ti5Eooo4OyzFN9pPHK7n/i1QuE0gRmQ/29oA4KFdMHZJjHSaAy9fC5lUYDqc+MGD1zhX
         qJnvyqRVrewIsQR9KgQKzItbrE2pUK86MHbQ+jzMY/ZI4DvE2eN0nQJCZRCi5KNk9UiI
         LH0Quy2egFTNcMBTdZtSGNp0Is3iG7ScxESrwYY21fMFS0rIxBymFZKhGjaaM1Y1CB0g
         esGjHepeZb1P9tCmMh2MGVpk7nbaWkeAIcZGYLrmEiyJXW8XFNfqQ0g6UQNYB/ZVcLqB
         TqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773737342; x=1774342142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xjrnRLDXHBwFdgbFPJ5wbch9uelKKkj5QYsOf+XR6ck=;
        b=nQd2LrGmdQwkDia4x1NNzcFGr1lHHCzVbWCc/LFd4b0lRJQnLTU6aShbxDKreVVsFe
         7y9+rriy4WWdcxF03GTYb4BoyV7d7m55VH8Y3YBD6W23CIvPoSJNxfum/kxtv5qhK5ZH
         vK3N6vUMjAybk2z+tGZk2pBa3rWXIowcK5wNOprTP5knuaHRYGhOT38zS4Dcbovn6o49
         WSi7/TAimQqhxN4b9zjPN4rhpGFYvRWDXR/acGXdwMqOWHPzTPQifEE7w6SNnWzKClTk
         Rc4oiGsUFlZWNNLAYq8n9DZyBab+Fsa4rvA4zAsleoeDwO/ogmW0LlNG6gfYS2KrFVey
         KoFg==
X-Forwarded-Encrypted: i=1; AJvYcCVvNRgZBA+XgqlyldCwqqnKUQmM6gMJfb29cuRV2W/JSf8Fwc90bDrL2PMP3Zo8jwgQiEgwLxl/+yOr@vger.kernel.org
X-Gm-Message-State: AOJu0YzRH2CcYFb5PqBYFVzjdfYBZHNm18pkXH67weW/1+WyjSxEkD5K
	1zai8cVYTUmLWuwoAO9PjTS7g3QpSxL3fx7cwKtaDLQW8nPf8TecoozXiIvgs9wKs1s=
X-Gm-Gg: ATEYQzzQwn5GiJGI9THxD87KdwdPl2CCE9G9ApJfrs7zC4q6nQEt2mgTr8OBpZZUPtS
	QxNMLK70v5auI8/Ind2MeOKzZk96+t4wq5cYP2372HonPzpaxdKgFrWLu37u/NSZ9A6Gt7AzVHh
	G6M4oSnH//KKk1hs64EGv0kRl9i4yq5pCfxwzgiXuKAo7jnKWrNzu2hHN/6KF/uI5421mR5Cbad
	X+lJ323WuRUggr2P6Fwgl0THE2J9+t12jC6HD38X1h5sVdTu0CuWBc8VM3nZNaarSlOU1Ty+ijJ
	EVSTdaGoKRP+Wmfj010e07V3m+C3a4fHkmZHFMagFBQKQTpiMH3oXMDBaHOq8c9QJnA30rdbg94
	SNCY/3TIln8D0TF7+bsMGxyiNfhb5/TR21/5aQ1FAqkxonp21xdlHLikTUTFXDjzjQaP9FOoP7x
	4wNHceRAiciyXRTZEJiueqOBAA
X-Received: by 2002:a17:902:e850:b0:2ae:ba5f:3ac3 with SMTP id d9443c01a7336-2aeca9a961cmr181695145ad.2.1773737341543;
        Tue, 17 Mar 2026 01:49:01 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece84084bsm126396425ad.82.2026.03.17.01.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 01:49:00 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:18:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, linux-gpio@vger.kernel.org, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, Viresh Kumar <vireshk@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, "open list:VIRTIO GPIO DRIVER" <virtualization@lists.linux.dev>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv3] gpio: virtio: remove one kcalloc
Message-ID: <bh5rgccasvor5xjunkc7wjp3resyulehnqafhzlfwqx2ealwxw@eqohebwzjq2a>
References: <20260312193717.12221-1-rosenp@gmail.com>
 <7jwgbrijeldghk44tdg2be5q7o7vuj5np3nlbl2pxuln6c7ll7@ntuquxxdnfmm>
 <CAD++jLnTJGt2YXo6ASXEjPPsMbrr+Mz3RKcCVeUpaWEMPm6DOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnTJGt2YXo6ASXEjPPsMbrr+Mz3RKcCVeUpaWEMPm6DOQ@mail.gmail.com>

On 16-03-26, 15:00, Linus Walleij wrote:
> On Fri, Mar 13, 2026 at 7:09 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > I wonder if it is worth it anymore. Why combining allocations is better when we
> > are ending up using more memory ?
> 
> For the same reason we are starting to use Rust in the kernel, despite
> it sometimes will take more memory essentially. __counted_by() enforce
> the same type of runtime size checks as Rust do on arrays.

Right. I don't have any issue with __counted_by(). It does the right thing for
flexible length arrays. But we don't need a flexible length array here and so my
question.

-- 
viresh
