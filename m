Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793470380;
	b=WE78P5Ck80cjdxx+639iCclkl4xPN7ZmtkYB9dCnz4LCdyPqqidtXBAts0YHO0eYfVV6
	 6cku/i6M/PZR6o6MnDUcAefH/buXWzEfG8QaToUQWEuW39ku1uNxUdPYAhSuqh7ctLqNj
	 swgD/lEd+3zBl30RgXyFAZywsx3fsGwDc0GjOcr9/FGpeuKSf1iOh7PKYbXg9+V0M/7D/
	 Zw3uOQvlcTcq5FEyd70JM4N7p9jU8SHZB1+M3qcsjwpxBKHflwCQWYYTrriDi6iBsF6lB
	 JrfD5D8smLAFfQgHS4fJyGXSUUFY2lzXOHEigzWOSgI/HDxHDshyffpJFK+OMh9ckUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793470380;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Type:Content-Transfer-Encoding;
	bh=Bu9t+xckQ649cYsrYx97J89fWcp9cK9989BQLbQMLf4=;
	b=Vn4aVeS3MJV24eZ7ceosBm1VO/4nucSIwZfG1XbKYlqk8sUc6H/6JAIwvDltUSnNdhCS
	 fvnKsPykDBr18BcDWvvtkDwi6e57JtiJuaFO3pTgi+Z2RBlpc/9ayHQ130QbEnhWMSsUX
	 Sx0jMr7rNt0UtWpr074czcGzzwDHlUVC1QUrtBYNqthrOeh7fGMhtb65Q5k4dGCXzMPti
	 85ICbLaxZV5tdq+Y1Dz03JZEle6axq2FhTACJmMFCBoFV0dZf4uDKkXZshtNjFfztaH/k
	 Mm/WtKrvRMlzoO/xqAK6UAn16pV9aYLFCEP3knEZPiPKTtx1LKU1OhbOo0Dyd1oX+FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c5EV9PIH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9C6606A31A;
	Sat, 31 Oct 2026 18:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c5EV9PIH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7033D1F0093A;
	Sat, 31 Oct 2026 18:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793470379;
	bh=Bu9t+xckQ649cYsrYx97J89fWcp9cK9989BQLbQMLf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c5EV9PIH88ZH+6V+38JAXBGxKu1tqqvlWnX6qKSY6k8BorNgJB1GjBm8685IwN1sD
	 LphXeasVt0KPZsC9xtOYGNOSCqfVonnFsQ4mBfc//5ksAJlJdkHjf0OSJDeSGdFVig
	 krs8EOHHX3OeXUD77D/qHv9ERt28+qlkLbUaKUHXamWDDF+fzQc/80EChAplPnRQh7
	 OPWoNL/Tc6sB03ljQT7yEL2NhPktbFePeb2c/YkV13fkLryT6EKOKZxD343jRSPgZK
	 +jC8aaldwU7dD5ZXhvkQMIFQShaAEkHHqLm8yBpcj41SU5LEZ0ayKdm7D5nJ6mCeOP
	 em6UpbeQ38poQ==
From: William Breathitt Gray <wbg@kernel.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Michael Buesch <m@bues.ch>,
	Andy Shevchenko <andy@kernel.org>,
	Robert Richter <rric@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v4 22/23] gpio: Unify style of pci_device_id arrays
Date: Sat, 31 Oct 2026 14:12:44 -0400
Message-ID: <20261031181250.3646047-1-wbg@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4cfcd6189bf6f281487a2eeed4fa1b1fe5521550.1793097104.git.u.kleine-koenig@baylibre.com>
References: <4cfcd6189bf6f281487a2eeed4fa1b1fe5521550.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=814; i=wbg@kernel.org; h=from:subject; bh=yXbTzPr9U1+GXQ6PCUEhlSnhJ72LDTFdC5soq5me2ZU=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDFnP9Ovuf5xXbcq5Ol9xMcMfxbX+iiVSoUcEDBuO7lytN PfHvOuzOkpZGMS4GGTFFFl6zc/efXBJVePHi/nbYOawMoEMYeDiFICJaKxg+CsQfE70yNJpulG1 7g2q8+u9jh1fevNI3zOWg4c/mURntj1g+CtdndKjdCUxfIuKYKfm7UMGmtI7utM8D/2zfTuJ95o rPy8A
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 27, 2026 at 11:48:59AM +0100, Uwe Kleine-König wrote:
> Update the various of_device_id arrays to conform to the most used and
> generally recommended coding style. That is:
> 
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>  - at most one entry per line;
> 
> Adapt the few offenders accordingly.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

For gpio-pci-idio-16 and gpio-pcie-idio-24,

Acked-by: William Breathitt Gray <wbg@kernel.org>
