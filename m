Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4290238B7BB
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 06:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900653; cv=none; b=GSZc2Jd4azWgFnj3xINf2z+5usZRbLJO9cPS3bMx6Ay/IWg7RWXfO42DVUHlISRncsxY5VLz0t1h2Y8nbZUHEBngZy4u9VSPcUtQBuOye8pKuOdyoDnJFP5Dk9Cha9CKvnftPUVJ+7uu3atBP8er0z8Gv5kOjnnHLDPvWqMiH+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900653; c=relaxed/simple;
	bh=ztGWR8iEm57omIqLMWGmo/mSUeOOpIElq9fJPbxs8hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qKfixHtI5eoVHdHuj9StFoo9UEd4iEsBsdIboBkSslMbzPtipxDxhRVP+D/Zv+Mu2/QqvxeOstAQdt1Zv4xLacuX+lo+5W5Gcjy0eh3tKXSyr4xUn94NoS+dJlPP4x/szr2Q+7EwOXAkh4X88eEuAQYmT+LnPZynr6AmjW03ztg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so34142155e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 07 Jun 2026 23:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780900648; x=1781505448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztGWR8iEm57omIqLMWGmo/mSUeOOpIElq9fJPbxs8hU=;
        b=n7HgCpyAF+jyce4mEeHP7HOE3MMd+OgSBHHVwWwosZAasP5mS1+gRXERbbu4RCNe8j
         6l5gVeJ15J1+90TJG94/QD6TRoI4cKD+DnE0bUQUfefvMT5LLueBmndRwvsXpfBKyiNm
         L0xCx6r358c857atAcjUpiJ4fvFHL4rCxEUkYgGgDG1Aa6MEBw9Y+h9usI+7gQ+VOY3o
         MT+B9bGy+wASsA2yIs0FXDGuZjbyoQb5wDBvtmBgoB4FycSyFnRXn0vmvzfL7EJbSQTv
         cTX3LecGG6EBfgBf6sg+ckZZ1a6yd689gXqQeGEFi8rJnDIYR+G+0w0M7Bc7nLsXiyMp
         tUTQ==
X-Gm-Message-State: AOJu0YzpiNXi5UkS6Go+d05+O5TcWFj1wwz4mNkXD3EvDg+6MNN4QHR9
	F1aNldgyv51JSD1PMup1IEeaoa4arT1l9+Wz9QNUF+yVx8NPtI50yz+p
X-Gm-Gg: Acq92OE3dZTvgSDjM7uEDryi+Gmj/oq1lJYjhZsIJ5PsCvk87ykLRlUg4PimX/cXmKV
	Ji/YGrOK56YdOpnbpoTXJ84OXpbu1ehK2UoxyFPauyeevHNACN2h4k/qRNSAHDsEPBYtPVo0g+f
	Lp+m49lGgpDM5Yi/C1xFlvo7S0MKFtX62Zi3Vwcb82h26xsgATgKx9OfnD35LT6lOlb7TbJNvGX
	pW47yFiVGorJqwGL3w0NhafEcZgBs0CIG7rRRgJC8l39VAMe5uN/XGrkcOWewcXJkXwwU7QxRmr
	LLReCP7usHcksvaJp3vnVDaaCtWJhpDyO+3AGmqxVeu2Yld27NMxgyl3l6AmVU5xxBbePKf7ZSK
	pwm6+zuL/PymncKqRB3OkCFOMfytLHg6JT9EpeB2RSrjw3UIZ2m/gLdZq1/Yqw8ZdtNfCSLebbz
	XB+WVBYfQ8DPUK67P0jwm5+/IH5m8YIu4cxbkYcFs+WBCnIN/KeVnicsy7lwHodWNttJ+Il/V4i
	nISp+P9rEcp7RXkcyihDpw6l4daiYIYWEpec7fRVA==
X-Received: by 2002:a05:600c:83cf:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-490c2cc3103mr176609535e9.5.1780900648453;
        Sun, 07 Jun 2026 23:37:28 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39e024sm489274785e9.4.2026.06.07.23.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 23:37:27 -0700 (PDT)
Message-ID: <06b3671d-ee79-461b-bbd3-bcc13d3c6538@reactivated.net>
Date: Mon, 8 Jun 2026 07:37:26 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: handle gpio-hogs only once
To: linusw@kernel.org, brgl@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260607215647.112488-1-dan@reactivated.net>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <20260607215647.112488-1-dan@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2026 22:56, Daniel Drake wrote:
> Closely approximate the previous behaviour by ensuring that each
> gpio-hog is processed only once. The handling of gpio-hogs on a DT node
> with multiple gpio_chips remains a bit incomplete/unclear, but this at
> least retains the ability to apply hogs to the first gpio_chip per node.

Sorry - this patch doesn't work as described - please don't apply.

Current code sets OF_POPULATED *before* trying to apply any gpio-hogs,
so this patch actually prevents all OF gpio-hogs from being applied.

I'll work on a revised version.

Daniel

