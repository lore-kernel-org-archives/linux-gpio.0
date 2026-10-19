Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFC43ED11D;
	Mon, 19 Oct 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407422; cv=none; b=N9X6YhAVswqLcqawiF2P5y2k9yM5/SaevPeGZww61+paT/2cD4HNBwikRM1cWnp/Xi6uVKg/u/EDfA4rU5VjaKEXx6ZpuEAHzzDAXgw1gOCKzHy1kakJtqlHmO3W98k5SVtWbriKkPIN6QM9XwjeBbdytX6YI6hy1dOjAbc0m9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407422; c=relaxed/simple;
	bh=DALrT/id4V/2bvUO78zlyN9fbURUxWGC+5YB5nc23Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETsIkAWRSkwNd+W0VqGHEvF8WJWqzmt93w+k6feR4cMOhdOjP2qCEmpr7uRaFoT5VGYzo5K0HEcMNud9nBBW3crRMIHJZqrFOCMg+xeO1cUcTRoCb/92IoL2bFSmRNq/FUXrOXsO9QBVMk12Svp/asKoeYJgyCNCtW+txA2yRXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZoapUDyC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XBwFAr6r; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZoapUDyC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XBwFAr6r"
Date: Mon, 19 Oct 2026 12:56:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792407415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLt/oKJK/5Dss5NWvEzGsmZkSdRi8Ntg8hSA1CHt/NY=;
	b=ZoapUDyCCVwj/8hC1lPbmJGxBqkFVQpy5wYbNOYDg0k1PoBnxsu00g9A13v93MfsCcvhLQ
	vHpabgyTPDMGZgKffob2onEn+Y22oxtueoXdvr6u/Mi91Hwwk+6NOq1Y/k9k8bt24hQ4Y6
	m6CA934c0mtQ0LutUOkKbxi6ctEVpXGkfShEwgIlPPU+jwNGhbiKBgQKhWIan5cT1vcjId
	WWbLoP/mAhBWFm/e4BRrymBe06eaMG0tvh/fiqn0QBzNFX7htBeEkoY4sEBKwArvw4+u+3
	D9T7l6apBNN5ZBs2q+9qXF6zzTrtmIRpBK65nV+i21eVoJ4gaXRuPo1sMGwdjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792407415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YLt/oKJK/5Dss5NWvEzGsmZkSdRi8Ntg8hSA1CHt/NY=;
	b=XBwFAr6rjxVA71xi8wGuRUqcDqiCxvU1DqFh6NSl972KrbYMhwfPo3MX22OKb5hxTVPFLp
	2JRDqaL4xnz0ORAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: sim: access sysfs attributes as const
Message-ID: <20261019125515-b6491e99-44ad-4ad7-b22f-9c405c4d3611@linutronix.de>
References: <20261019-gpio-sim-const-sysfs-attr-v2-1-9ae103b8a680@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019-gpio-sim-const-sysfs-attr-v2-1-9ae103b8a680@oss.qualcomm.com>

On Mon, Oct 19, 2026 at 12:45:48PM +0200, Bartosz Golaszewski wrote:
> Use the const variant of constainer_of() to access struct
> gpio_sim_attribute which wraps the dynamically allocated sysfs
> attributes for value and pull of simulated GPIO lines in line with the
> currently preferred approach.
> 
> Co-developed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Thomas: thanks for the hints! The code you posted compiled fine so I
> included it in v2 and gave you credit in the footer.

Looks good! If you want:

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

(...)
