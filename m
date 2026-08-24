Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF433396D14;
	Mon, 24 Aug 2026 07:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556940; cv=none; b=FAuXONjjUghQIz6q7h9n8R8uM937PQVe6MjA2q+xzWncfODdPWvuFZyj/MN/nkfm+1NJxI8rdVjNQi2wtABsZyFGL4jEdsfQz4jCcX+yHX8vlGEpD6aFsS3ily5dZ2XdMIv2w9woGffVsxb35wchodGhkbx/DD7f3qGF9zAYldw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556940; c=relaxed/simple;
	bh=q/g8NJOaENOuQ2WFxVG8AbfQUS+DkEXkOFi2WszB1Aw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=QMOLd30UzCmB9PKrDxwFWmgSjidVkFJnTkz8hxFTL/SqyJ51Z3XT2dGkdUzgJJaVUrO4K0dhai8/49Y+zIYaAndu3VJXPdNngRMW3VhN/SAms7NJRAhgOjcW3GSVJhKKQ1jLH+9lBoKi+X+NXp3Yq/BxM60dsLC6kia6ER2hHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=AYA0NmP/; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="AYA0NmP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787556935; x=1788161735; i=markus.elfring@web.de;
	bh=q/g8NJOaENOuQ2WFxVG8AbfQUS+DkEXkOFi2WszB1Aw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AYA0NmP/0LWuMTKY7ooSHPsGa4zc8HHMnNA1WKTZhVJbdwtjtJG1BpljNHydajFq
	 +7Pc0iK4LVcLxevpZSMqk6fhs9mi1hhNXkSSfeQ5/LN6HVrNay+NiW+ECh43Cvtle
	 qH20pU506aW1+shEBPvNE6caNztbxk+XY8mv1l+pEwM+hsb1C9jfP0pEJxvIqwjxM
	 Jk5WCtipVp/K/qB36augb6jvxZhiwc139z/LHZz438oyfdmkgU/6U02Gb/KDpazXv
	 kysD/WxHINBsxh/TgXZ9HdENGs5VYoKxpbOzpb/HD/aCHmO6Xq3mKfc5M2pZO8oVh
	 3GdAYyeBLrQnP2PGQw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MYclj-1xSGHc00xf-00Ol90; Mon, 24
 Aug 2026 09:35:35 +0200
Message-ID: <f42f463a-e2cb-486d-91af-40c646d38b6b@web.de>
Date: Mon, 24 Aug 2026 09:35:32 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manush Prajwal <manushprajwal555@gmail.com>, imx@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Frank Li <Frank.Li@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Jacky Bai <ping.bai@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Md Rabbani <rabbanyhmm@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
References: <20260814190527.969-1-manushprajwal555@gmail.com>
Subject: Re: [PATCH v2] pinctrl: imx1-core: fix device_node refcount leak
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260814190527.969-1-manushprajwal555@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PwYQUUsoSwv2Z3S8Eec2KvSwXdDwl+avsF9Auc8cUJcqSs+RzWT
 ebhD33QiPp4fFYEW/gv2NrUA3lSBq3RqVYtdC+4aekFVKfjd1yk6mmBdZ64oaUFeilD8TW6
 m5PpL8e12NilxAb4p4icsYL5rCDrhKLUVUZMXNwW299/JodLk7EcBQjeeJ3H8rNyUV+HIDg
 mak1RB1YjPa0QGys2YOYw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2e8Ig6gz9AA=;XYjB0IL17CfScOfQ85PYGCKWdjW
 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

=E2=80=A6
> Rework both loops around for_each_child_of_node_scoped() instead of
> adding manual of_node_put() calls, matching the sibling helper in
> pinctrl-imx.c and imx1_pinctrl_parse_dt() in this same file, which
> already use the scoped variant.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

See also:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.2#n145
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.2#n34


Regards,
Markus
