Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25462492531
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 19:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734348; cv=none; b=JnSRzWi3qPSZJrDexlsq1ENTNEzlhe5HAIAM6ujjdw/ZZ1CiXoqpliEgsdTXol8l2ZVSYPy7MJYn3KnRxlmrW+mxqSwY4l6tb1MTqQtSkcYMj+mAhWHhfT+0Ovg8KgUGtx+cYz+1v5Wug+AtpvVOKjUwodTOlS5krhD3DzXcJbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734348; c=relaxed/simple;
	bh=6Wp1pMcM5hwaADkkdcdckZfs3h1zttS0Kz4AOfE7Occ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gJqfQxJSNcIyaxxRolboVhl2o23R1Z4iLZ2cBqmrOVviB7sjGCpVYqM6Tpjf4sRwYAGdTxSEijd5hAp0i2FQOUapbFLHfOPH+7vDDcTUR0spgu9Pg5A/sv84EjwTHrbs14SgPFSUSDakQyox3S0F1MHUNVsc2kInBpfko3s/0dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhCDsKSg; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhCDsKSg"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84874b52eabso1687881b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 12:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734346; x=1787339146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnPkLJqZQz4hKZtS8FG6LEBJCnBc6ph4JdLLK3tJlY4=;
        b=UhCDsKSgjTLzbnR284NAh+lm/y+KzIRMyvq+CBTHQQu1KpAIfKNr4bL4JXXcrgA2wN
         DCUa1l21wrEXcqMmfdwZZs/vo6iKNjuS6rzIx3tT7e+HnPGNT7a788UqvqeUbPqHbKX5
         FX9yXzz50y7rWZmVzz0Ne/Mg0tG/kYyJ05An300D78uC4iXW6kJgEAzQUYo7BW20YtD3
         yV+iFJf3W6PM53r5I3+oQA4KeRJmnwJIejXYHe7znoRqQ1t2Eu64w8MVTJGimfB/3HU6
         K/pVqsXh7mfE+4TUdDMq6ZawUR8SpW4L7SFMN+dqDQTcHIJW9EGZ/012eqABeETIDCAf
         SVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734346; x=1787339146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnPkLJqZQz4hKZtS8FG6LEBJCnBc6ph4JdLLK3tJlY4=;
        b=Plo21mPTIZIV/UstbDUGCn/N5s7Z13uDe5xzfpNnZ0he4++YXrvnBg2yZuiIv4/Xao
         PNKhDjwo1FTsHY39Rt2K21T+36FfknDonw93I9YNOyi+PXcC23hrLAOG5zslVO+Ya1To
         mWTBAE+YlL/x8afFiKRF2/sVbsAF6MqqKiti4Bshaapy5ms6uEPH1d2TfwIesZWbzLed
         zBQjLmpTEquZRRqcq2WjUtgB+axJImNndzL2R7vVXDiwv8ieK1uOabdPTCTgPyw7TahD
         dGPaa32eOLla0AL3YnyMT6uPEOsh43goKDuE065QZKril7R13QfiBHYVP96Lr24/tXta
         YJPg==
X-Forwarded-Encrypted: i=1; AHgh+RpaO1SJGsSD1migrZVOGt3sbcN8NppmBAq2TGvKQ6AvT4mHV9oEBgsN7UiOXYsn/B90RWJVVFubi9b4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/eiqY08LSYkdaPIjmot8MZ08NSoyQNSY8Qc6ceRy6x4M3K5dw
	XiD6tZUeSCZVOMC1WLqCP+CGl15QoIcSil78VvToV6ZSEQuqz3F+koOE
X-Gm-Gg: AR+sD128t67/bq8Qsx8394kn7eXMsjPreTE0s7tSBIMEXbjBxt8zyos+VLlWhy/qJdC
	SQHqRINXtKX4qyIVs3RF9DEzfXtOsdRGeOk53bCGwfAn5HAhlIjoGCxpa2dmEf8SU13oAtDQglT
	tkFSP0q+nwDrP9y6Wwn1HxH0Ef+WXBvyolYXYCSq9aws/mGkFmJ8D/sxYt+5Tcpn9pp9IBQWZ4A
	ub3yl3ZAMOnh3KeKWdYTuYAoIJeCrbORg3O6sYLlxIGmyr9fKOW67HHEQP+002YctbBDKG/g67l
	51TJQTVq+VnBn7R3OYLrBqGwnqnDtfGkKJkOtaaWJ0gP6gAt575DFDcgOWRr89pPNZP6o4YheOK
	fdpXwdmS8Op40G3A+QfuHfaJEaxdRRKUJ/X+LkwO+qCEdeuSAt58XssGAtdTksmMbfd02ClJmfB
	CSwPIhwyj9TaJtE26PRNfoF9wwGryToAWZyJnZaXZGZADzlBN1xQVP7ImDz/XDtKKKmDM8LstFO
	qWjkWxASJfJzPtSH0gR4f118La+GvTnLlopaSC2rQVv3ZwDtUYh//7scJdgFTwPKYzp23nXuX78
	NQ==
X-Received: by 2002:a05:6a20:d48e:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3cc71a2c76bmr10428980637.12.1786734346257;
        Fri, 14 Aug 2026 12:05:46 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:94:ab62:887d:e555:df21:3318])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d66e52d2sm7081695eec.13.2026.08.14.12.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:05:45 -0700 (PDT)
From: manushprajwal <manushprajwal555@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Manush Prajwal <manushprajwal555@gmail.com>
Subject: [PATCH v2] pinctrl: imx1-core: fix device_node refcount leak
Date: Sat, 15 Aug 2026 00:35:27 +0530
Message-ID: <20260814190527.969-1-manushprajwal555@gmail.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Manush Prajwal <manushprajwal555@gmail.com>

imx1_pinctrl_dt_is_flat_functions() iterated child and grandchild
device nodes with for_each_child_of_node() but returned early from
inside both loops without dropping the reference the iterator held on
the current node.

Rework both loops around for_each_child_of_node_scoped() instead of
adding manual of_node_put() calls, matching the sibling helper in
pinctrl-imx.c and imx1_pinctrl_parse_dt() in this same file, which
already use the scoped variant.

Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
---
v2: Use for_each_child_of_node_scoped() instead of manual of_node_put()
    calls, per Frank Li's review.

 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0..fa8f6a7e03 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -547,14 +547,11 @@
  */
 static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
+	for_each_child_of_node_scoped(np, function_np) {
 		if (of_property_present(function_np, "fsl,pins"))
 			return true;

-		for_each_child_of_node(function_np, pinctrl_np) {
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
 			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}
--
2.46.2.windows.1
