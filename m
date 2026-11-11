Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389761;
	b=3zxsowEi1dr3tEjurtXhnDk7UbezXVjv61Pwb81Ysoib6iBSq2BFiuRqmipLbbfM04A+
	 BbrQxfA/9CEcHSyzi8CP+cbwiSBSeT5NbGI/WQ7ZS1iWborjHLd8zSECa1w3nFiM3dMkH
	 fkuCBv1sk47HjS5xbwrk7PB0L3di75ZEu2JsXoUqmFULKi/Nuzh3Qa4pZ8aIFIO73ENAe
	 K5efHCVe3eoGKf2yOuuxKY4zG6pVYDpRXYEDRNYgLQbmnHyYkewOVJ52QiTwICyrxRbjz
	 mCf08ZLg/VwFbszeiTmkMGjDTaIfG/8AYUTcS26p186y1MXnc9bwq4SzS97kNs+zwHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=FLxx306+tAISOP/bkIgH6EctXfc6n+IEfXg8sHsWejY=;
	b=u4qDY2l5oLw4m/ahXYkBKylKulF62PktnJ9PrMkAhEw5g9qK/SnHXuZkwsynqvlDeafw
	 XK+vfTmih+opJ7o4rvshsOhO/lMuWwiZUcHa/+oERcWDoi2YAKr+L3kRgaMViNl2gwsdN
	 qTClc+t09OZS/y9lNs99e07I5AX9I3l1N+hji/ZIxAu/0wigBuVgpsRsLLrX/YK2CLlsc
	 BvXo08jXnrS9PxZCkGAAzeb3gV+ZiNdYDbSthcmO8y9fRNc44g4JsMEKKgwO5Y8W/mPJh
	 ovJw1Ax4AUv7wnNKwceHlyp/iY33GBO6p13DAONbVGA5shyp5Q+YPzIq7iXyx7j2QWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=OwAkZraT;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69868606A324;
	Wed, 11 Nov 2026 09:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69868606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=OwAkZraT
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jPdgG1F6kz5B147;
	Wed, 11 Nov 2026 17:35:54 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794389754;
	bh=M65uMDfm7EZkwKp4x31kX/uQWmsDRn/+DdbUriicHVo=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=OwAkZraTE3FJ3UG0y+tDshPE54pAg6EbZwPOOv7C55mwMIVC9G/zMQXwxjn7vvfr8
	 IQaOlrC0s99xVjXt7NNsDfQqByYjKpzkJyLbaqERTkzxS4CRfgvC4EiO5Y4KkiQJTy
	 xgx75OGpH/BIAnCjOBH8idRGJ5IU+NEddks08XNAIBYP3jQ6I8XEtnXTPKHOjCq3nY
	 XJLNRJlkC+ssqjsrzg5Vn90DtN5bHDF76RrGtMwV5Mt03vwYfbhuLXvkaay+Ha86or
	 8jOnNwDfNuLvcJwHFlHMSmOlYLiIXU0gQJwEz8LdidZLOuEorZ2OeVZbrTRnWdhCh4
	 mMxlzMnTc609w==
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 6AB9Zih2007469;
	Wed, 11 Nov 2026 17:35:44 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 11 Nov 2026 17:35:46 +0800 (CST)
X-Zmail-TransId: 2afb6af436f2a9d-e5b02
X-Mailer: Zmail v1.0
Message-ID: <20261111173546439alUdLx-iD6-ISoa9jqS5H@zte.com.cn>
In-Reply-To: <8f5f5582-523f-4632-be69-b176f7ac52db@gmail.com>
References: 20261110225742308FW7iPw8mc9gwd2DU0W-_w@zte.com.cn,8f5f5582-523f-4632-be69-b176f7ac52db@gmail.com
Date: Wed, 11 Nov 2026 17:35:46 +0800 (CST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <jelonek.jonas@gmail.com>
Cc: <linusw@kernel.org>, <brgl@kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0gZ3BpbzogbGluZS1tdXg6IGZpeCB1bnNpZ25lZCB0cnVuY2F0aW9uIG9mIHByb3BlcnR5IGNvdW50IGVycm9y?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AB9Zih2007469
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 11 Nov 2026 17:35:54 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF436FA.001/4jPdgG1F6kz5B147

--------------------------------------------------------------------------------
Hi Jonas,

On 10.11.26 17:07, Jonas Jelonek wrote:
> I think you still need to move it up where 'unsigned int ngpio' was
> before for RCT.

I read RCT as ordering by decreasing declaration length, in which case
`int ngpio, ret` after `size_t size` already complies.  But if you want
it in ngpio's old slot (right after `glm`), that's a one-line move --
say the word and I'll fold it into the next revision (v2 already has
your Reviewed-by, so I'd rather not respin just for this).

Thanks,
Shao
--------------------------------------------------------------------------------
