Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0612937E2E1
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942057; cv=none; b=ou4fdJqK5L6hDmjW0zadpn4NfncYimLTFykcCt60jz7wZbieWonLEaXbVcQI8+Rt1TGIGRqNDSl1Nrefe1Vsg7/3rM3EDcfH5z1uTJN/Daqiq2sRRUWDn+CLqLLX37ssN36s1p5s3bNYIlEgZpG65OHRW7c3bSswQCxbtF4ooTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942057; c=relaxed/simple;
	bh=cGCZivSYY3mYxmlVwhY9ctax57eOdgb/k+UbxMjtflU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oo2qEOgRICKKiwwZsr7FnkpTc6l8/u/nYIyDY442KfsS9DYKd288b8K7nH42CC4sisQO254xHra0Xezhg35kFxFx7FXTssiVmXcqxUV02DSbl/skwFkWJPQUSxjNN8cHDqpmZ3vWfIN6m90EcbcGypNVlLiIrv3QSfgEkq08Jkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YdmBiNe6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YdmBiNe6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cGCZ
	ivSYY3mYxmlVwhY9ctax57eOdgb/k+UbxMjtflU=; b=YdmBiNe6j2/J9y02JRuj
	51OfxRlQTjOH59+FSs0QzbwdTlThHDgQAOiRAVnsedt8KOd7XHs4VJn5p7796iJ/
	ngxSScttwTpEgckiEF/s4edaWE5Wnikarc7MIgJdgnS2hm4tLFB6sYYhgtUgaR4V
	951WrM6b8yVg2JmX56cjR0XoszVVsNLojkAb7luRaVrVamTmUYILdH0Lky/TrQxn
	DABSNo2KptSEK5SUqKGLMbE6tXFnjmLjHWgYcwVLgpY9Nm3v+DSUhvoOYZIjbWSQ
	zYdph3DMP1q6usWYc+K7yt9O/CLv5ouS3cbxA98WOqhVwxfvnn8u6fVCoLp1bTKD
	KA==
Received: (qmail 2606867 invoked from network); 13 Jul 2026 13:27:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2026 13:27:29 +0200
X-UD-Smtp-Session: l3s3148p1@p34jYHxWBpoujntq
Date: Mon, 13 Jul 2026 13:27:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: add a comment explaining
 the buffer init
Message-ID: <alTLoNmDmPulfm6D@ninjato>
References: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdV415V23a9E2QM77iQdGePOoZYNk=+v0Hms6uxugKBu5g@mail.gmail.com>
 <CAMRc=Mce7WXrme_z_ZoUCHqYUAdP+Ee6rHB8TmRdeZ18kBH1Tw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c91XIKf/FrLfUXZD"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mce7WXrme_z_ZoUCHqYUAdP+Ee6rHB8TmRdeZ18kBH1Tw@mail.gmail.com>


--c91XIKf/FrLfUXZD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> >> To avoid more false positive reports of "leaking memory" when
> >> fops_buf_size_set() returns an error.
> >
> > But who is freeing priv->blob.data when fops_buf_size_set() succeeds?

This might be a separate issue. Will look later into it. The comment
added here still makes sense AFAICS.


--c91XIKf/FrLfUXZD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpUy50ACgkQFA3kzBSg
KbYGdRAApfSy+wo+zSbPAkPmVdRBhbeBOEMFOJB25PRZxGfLddniKLkjq0BScl/4
JZ0Rwbo0Cp+Mh9djnSRwbU6hutdEnHl1kRqPhi8iBRxwwQnu9ZNQjbMtKy1MQsCU
ZorXstbssP2ZUPM2Pb9E4Dzmy5xg4XAxqY7KYfnJl7a4ClrSjTT79gCFZaFA/c3o
Vmt4tVFxnu0fP7ACSN//2aiV77cjQl3Nep7jTWrA9da7vJN3LkAuiuGchNFmRwDI
VadeMoZDDR5YxMfNF1tHawtTIyft4YPKZ95dMwyan4od4zwBo+CNTWwP/oH2CjlS
MAWncBKqZJHZ0CdscHCkT8KVFlb1yY4gj0uLx0sv+S5eZM6+dTNMqnjjmS/MFdGp
27xCOvxS6caf+ZE70cvYz+qEpA1lL1T/LDsONFD/RdT7VVoXlCI5wBp2kwhOe75g
RrZS4yalU0Jyna40t2gLeyMW5wZ1ycySG1eIkKy04AdQoCLBYxmappFxoDDifvzr
w0PIhL42I3OhKiOB6DsEsT+NJAeFf7t51JjWe0JrT3TwsKOae7R3Hg6X2WozyEtr
KV9mLnWgKloGTLCt34dwLTBMdd4QWOEjBmSRNqJ5qkmTdCp0DsxUeCMVsRCDJvT3
VK4t/Sj38XRESapDzGL1GuV82YdKEJr+mBr9fh5kYHL4vka8BKs=
=P/7l
-----END PGP SIGNATURE-----

--c91XIKf/FrLfUXZD--
