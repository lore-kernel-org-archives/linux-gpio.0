Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203863;
	b=5bhCYOvRt99xNx9iyaqEtTE/3b0u4kwWQrS2QDjKE6cEWAHLv5g2tRA4btTnSt2b6yaK
	 trz1St4o0Oyosc9FGLCNaD8C1QyUgl1nP+82W3fHmW2XnAtvE8tBaOgebYbRjv2TJXeGZ
	 gOMOnMR+ucb7HkpHDkzzQJuabOK0+kW6MDTTiB0DMjFVFSX9SxRZcOqzSrqASNSurjHeW
	 EFfRxOeQEIkpqnmMGAySYWU5lmQv30I0c5Qi6zU1RwKFSq2XrWLAgnZjj5MKP3KF+7d/I
	 6KcpFWlfQRawvtYXBW/qiWYBXCJKK7Or/E09nGIAJw2ivH/p87GydMRj21O2VSLdjFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203863;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=habbKoVjyUIfpYxHGyIhWwSLWbBVYJw4ZHdgLkM/c3o=;
	b=vDNHJU53JrRJAvV5/TnXf7cqGxHiGzgaFcn032PnUMUuAbqfYB4HkzBAcG9ClbgDHNTt
	 OY3aBz9AfgrQaqNIgHBQuIfMRLZqjzwsQLlAB6E0cpNUHcdyahGfrBs4KPSTTpTNjPqNd
	 Va2yXVcWiYUWyYOSTb5IdMAtSSlNEimQhDAzKb3hPFp75Olm+qbXpDD25pgVlNqMR8A+L
	 uWR2E3iZnBv3M7l3kpxcB07bKHkwmAB/+wUaKQfnbIeW2urX639Is9yMcZaMZXpfVlkxG
	 pEmGXhC1deRXSBjBT8Y9pyVrRtHz+bWt/wRCcb/9SxMMGvbbvav6s2JD7KWpJ2uuUbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mG+6ID9o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 12512606A6F3;
	Fri, 20 Nov 2026 19:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mG+6ID9o
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9730D1F000C6;
	Fri, 20 Nov 2026 19:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795203862;
	bh=habbKoVjyUIfpYxHGyIhWwSLWbBVYJw4ZHdgLkM/c3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mG+6ID9oYBywFsJ5b8/sMM/UfOWoFdN5BknnVGTxwikr+oZklbIWCpFnfc0AszGYH
	 qrDqloCsRSf1YNekE9YtN9jFSAKc0Wpc0+uqJsHR9xTAYMksYZjP1MFoDIrp35EnXv
	 dTuVhjTOZYbjELIJst+5wIl+OxCmKMuciBNbBwhaFR6xMkgSt8gVRDInSssQ04eZ4s
	 BHyo5gdGKa/JxXRBROGgJoqrVomzdJUJfxDgln3uLACLsF9ZxZW3bQKXSl9wizG+TU
	 SM5r1zOJ0u7B+owX0UF5OAU+OoiEGANzU/6IDUmV7gTw75Cscdj5CNu/TqKoH4vT7Q
	 LWG3imttNWYXA==
Date: Fri, 20 Nov 2026 20:44:18 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: warthog618@gmail.com, andriy.shevchenko@linux.intel.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: gpio-watch: Preserve line event read errors
Message-ID: <eb7mp2vwp77adohmidgcsqzh5n67xnw2e2bumjg46wnwlhtwgb@dcl7mjl25gk4>
References: <20261120061836.98108-1-zhujun2@cmss.chinamobile.com>
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
In-Reply-To: <20261120061836.98108-1-zhujun2@cmss.chinamobile.com>

On Fri, Nov 20, 2026 at 02:18:36PM +0800, Zhu Jun wrote:
> The short-read check sets errno to EIO even when read() returns -1,
> hiding errors such as EINTR. Set EIO only for a nonnegative short
> read and keep the original errno for a failed read.
> 
> Fixes: 33f0c47b8fb4 ("tools: gpio: implement gpio-watch")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---

This was fixed in commit 845dbb71d620 ("tools: gpio: gpio-watch: do not
clobber errno on read error").

Thanks,
Bartosz
