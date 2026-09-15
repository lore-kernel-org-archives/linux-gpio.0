Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87239411FB8;
	Tue, 15 Sep 2026 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501702; cv=none; b=pBgDUhOQ+drf+/1Xv5WlWYsLVURUMZqJXM8TRswhp7T5pNuNJeEpI14LtHDD0rHnPrxjISkKUkh2Ha3r50/EQkjEplfQWkpB24O70E1ZdPPZWW+cBBCklEHx5Py92M58cKdg0NIi3BjczzOcUQyh8S3CMfp+aQRj+0Q7xb14my4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501702; c=relaxed/simple;
	bh=nXCt5s8XHSIzz3K0qwyItk5NRAka6jgRI04dMtUHlgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ukQXKbqIajze+NB9L2cLLPimetqUcQaQQtsGADUamtluZrLbJ0/5qSq0WjqL0jNX/xfII+SbrFFtrkrtY3Xr+WZJ9WL7Tr23Jf4c31IAhEZWEvv2u6AYdyht9cdEa+YTVNKx7L0F/Fk51m8N+ETpyjvrbQ7O1IDdS7jvxpTPw3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VGKT2qpc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VGKT2qpc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8E0DF408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789501700; bh=reat9UBLUIspNcqaDN08N7POgOUe2gEEG998iMnROHo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VGKT2qpci20UYfKNfLrAebhbJ8uguhiOb1F8B/6oC9thcBJzMkSfig5PoWh74K3l7
	 fTmtmR23vkqOcoCkwgW93NTuGvGX5zNg+r1mboTwELMEBSO8VaUoNuE3KBUCKEAEtT
	 jfFd/D/xG++TpT9dRm3s3Ymgltgh0nNZ6c2dZ7yxumOPLfRgQq35KTMVsTK6niDnzk
	 hCDvbYn1MbJmrcX+X1WdyJXwnVsat76CvQhYclBUl9G1seJq8k2ZrQ4KIi9hDU4By6
	 lrEulQki8kVMVsb0/Np3JHOd9qHo9CqwOLvzKnw4xQKa9RTO1iPeqtpSmTgTLVyZs3
	 KD+9ehee64O5g==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8E0DF408B4;
	Tue, 15 Sep 2026 19:48:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?Iv=C3=A1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>, Bartosz
 Golaszewski
 <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, Jason Wang
 <jasowangio@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Iv=C3=A1n?=
 Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Subject: Re: [PATCH 5/7] docs: vduse: align documentation with current uapi
 and driver
In-Reply-To: <20260831143125.151360-6-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
 <20260831143125.151360-6-ivanrwcm25@gmail.com>
Date: Tue, 15 Sep 2026 13:48:19 -0600
Message-ID: <87ik4670u4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Iv=C3=A1n Ezequiel Rodriguez <ivanrwcm25@gmail.com> writes:

> Update supported device IDs (block, net, fs), all six read/write message
> types, the VDUSE_VQ_INJECT_IRQ ioctl name, and VQ_SETUP group vs asid
> usage per include/uapi/linux/vduse.h.
>
> Signed-off-by: Iv=C3=A1n Ezequiel Rodriguez <ivanrwcm25@gmail.com>
> ---
>  Documentation/userspace-api/vduse.rst | 33 +++++++++++++++++----------
>  1 file changed, 21 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/userspace-api/vduse.rst b/Documentation/usersp=
ace-api/vduse.rst
> index 81479d47c8b9..d316857ca5bd 100644
> --- a/Documentation/userspace-api/vduse.rst
> +++ b/Documentation/userspace-api/vduse.rst
> @@ -11,11 +11,10 @@ to make the device emulation more secure, the emulate=
d vDPA device's
>  control path is handled in the kernel and only the data path is
>  implemented in the userspace.
>=20=20
> -Note that only virtio block device is supported by VDUSE framework now,
> -which can reduce security risks when the userspace process that implemen=
ts
> -the data path is run by an unprivileged user. The support for other devi=
ce
> -types can be added after the security issue of corresponding device driv=
er
> -is clarified or fixed in the future.
> +Note that virtio block, network, and filesystem device types are support=
ed
> +by the VDUSE framework. Other device types may be added after the securi=
ty
> +implications of the corresponding device driver are clarified or fixed in
> +the future.

So that paragraph was somewhat impenetrable before, but I think this
change has made it worse.  What are "the security implications"?  This
has the look of a mechanical change that isn't really concerned about
what is supposed to be communicated...?

Thanks,

jon
