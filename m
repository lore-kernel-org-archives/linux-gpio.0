Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1D937754C
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525193; cv=none; b=HjTJ2pfqY6R+QFSuUt0GvK2tvJ/veRdf1/xLLitvSBo9du3fnheBdceVXbT8NzjmhYPxtG6wHGl9722pA4JAng2NkV90hfrb/sJMbrK8pP7MBb/pX/NzYCf4Z0ZsCkJEgHqp/8vzUKIs7qbK8r6OBEHIjn7R2Mh1qaCRkEmnds0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525193; c=relaxed/simple;
	bh=/j9rVteROUlD/CBx3JYGlCg/IAH/8DfCzmVfvXK9zDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTOk7NBuxWAbMtpmxa9pQGULA3G5vzt2qLNQ5Psgt69pn0EO2Rem5GzsgC7x6n8SFerzad0tI0ezS8fR6Ym6IAsEiZG7slhiHBdDhu7Lnfik9izYqNERnSN97GEi546yG2YlgCZytSBXHLwP4Btxrw7jWUjf1GaNPpJ6m9B49l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZQ3WTYB; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZQ3WTYB"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b7b4b08d78so333280eaf.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525190; x=1789129990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xbb3yAOMomXhnJskipNUY9uV6VlgHGEGNQn0Gb56VVY=;
        b=ZZQ3WTYBvxQqh3eX9BmFulYKBiVfAvz5Z5/Vn58iyNcSCfnUewXmXFadOpr/MFR+7y
         zecIncAYPA+LXPhQlUOB2Yq4Fvvqtzzgidl5HdlA3uOSYaATkrtMmjCnPsU9XsioPCNt
         mGQQc3uASERCbPdPN7yGxcqFAJJRDi3EODJo9I0OBRminH9UDCXYtv6qI4rkHPi8XVNy
         OiGmL3514jKbJmEPAoOJbF3ldVFMl4UmwIPwzwya8ERSHfiEH6DOlZhlI2KgkeRLw0c6
         bV2LxJpjk3m1mbjHStuR3lQG250IAQu+XrgLgO+2X/HlJKUAE9byLMHqFVEkE1wtWxSe
         /vSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525190; x=1789129990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xbb3yAOMomXhnJskipNUY9uV6VlgHGEGNQn0Gb56VVY=;
        b=dPqSIYmZhue2jJ3d3NuQlP1Fo3UlZDHYCZ35tBbW1089eSVXPGbnrc6pqFFXXV2nWG
         Mcpqg1RSppAc0O2VgNGSKZh2H3j5KH92hdyvvUlCPBoMnTd3cQEXPVETsX8IWvzN7O63
         OXzGJYVc0ZAWJiqY/X+Z0+otTiYe92bwlMpgW0cb0NtFa9EOvSwjs47U3EbHkujYb5QK
         dEDHA8slBwOK+UYbbZid8Zcf7DoSikHfgqfqlYtjBisTo+kA/IK5BZkC3t5dm9WG1Rvq
         L/YnTJGzCEObQ97xHCNSi+AXSGe/K7lLze0Bq7pOvKpSsCtdSIKl/svp3WInHffvrzRB
         6bCQ==
X-Forwarded-Encrypted: i=1; AKwUvBylot6zSgzYn1sXHFBtdwb/l5dFIexB3gxFOJ51hABUuMTBfvzGl6IDeD9bwoJ5gGFjDvPwVjyUqd6E@vger.kernel.org
X-Gm-Message-State: AFuF++mXdmaRLlMNxmzx054wBzVtL3/c3NeiC9QWha7Ynnh6YJ2NWKsz
	C+CDfwDC7BQrglR2tKmWHcbBRckl7LNLssWerjAMVu15u4XSA0g6h4RO
X-Gm-Gg: AYBFou0/P2d23TXAzG5mynBu9608x5IC9nU8q9bdeyaWwnn9ZsDNYg5dHw7aZOxvQNn
	bNauogFSSCAC8pzJ8FoM0rcO+gJuLm7zeqfaL8nh5U7kVkg4WeJ46/cXPEVMEODe/aA3Dy4JuRa
	4uGRdxEQej6acgOz9jeK0j+clVZKDXA/UZvvsWBz30odMBaN/qwUQHC6UwPLg+PjHrF/SjelHxW
	0GCRBnKYV15cYgq/diyb2+1+ocDdqG3VaOazR82OL/PARk/kE2qNb9omQM6jU7JD4NjHBtBdLdz
	wWz9pOu20gKLNx2qPeT5diKXojIHEJ3Wt/m58ZUa7sL4Har6CV9hQq9hcDZC4y5p2EWQsxgtCgK
	X9YkT0EB14HKs/d0f1vFUug67hqQlBZSu3fzk01/qtFl+TkayGIAdbyMR7JhQbCqBcJJACYGwKP
	b6qvsyJOjwPadwd3m3qHs8oSpi/lG5d5gVQBTadSKORbMDazSFHjpHdvjv6TK1vTt4zuMNU6Iqq
	GE7fT3YKwjcaqSH08LhhT4UJw==
X-Received: by 2002:a05:6820:1623:b0:6b6:2601:63df with SMTP id 006d021491bc7-6b6fa3dd918mr4319735eaf.11.1788525190297;
        Fri, 04 Sep 2026 05:33:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm6343458eec.27.2026.09.04.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:33:09 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: fix typo in log message
Date: Fri,  4 Sep 2026 18:02:57 +0530
Message-ID: <20260904123300.36778-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904123300.36778-1-hemanth.selam@gmail.com>
References: <20260904123300.36778-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the misspelling in a message the user sees, reported by
scripts/checkpatch.pl using the list in scripts/spelling.txt.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 349eb944b4ac..8e6cd35fc80c 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -618,7 +618,7 @@ static int funcs_utils(struct device *dev, struct pinfunction *funcs,
 
 		if (of_property_read_string(np, "function", &fn_name)) {
 			/* some groups may not have function, it's OK */
-			dev_dbg(dev, "Group %s: not function binded!\n",
+			dev_dbg(dev, "Group %s: not function bound!\n",
 				(char *)prop->value);
 			continue;
 		}
-- 
2.48.1

