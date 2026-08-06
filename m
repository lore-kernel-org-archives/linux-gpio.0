Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11022120.outbound.protection.outlook.com [52.101.53.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB21217B50A;
	Thu,  6 Aug 2026 03:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785988645; cv=fail; b=BwqhUxfMiTekzonMPxY7txZUTfxLChWI1UYiTfhuZW5EeXpMtObR1OUTY2rTjn//yH8EmhPNw2F2UniU+UU+ArwaYtt85sBG+Y4CvZ6NF7hSoCAagNx/Xy54Eml51ypo73LMZ/GpUqRdrm1UgkfYnwYWaxizuln/hvUTn/R02wY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785988645; c=relaxed/simple;
	bh=pRjYt/eisFXwLiuZh1z8cGD5a9M68WOdz6QynsZEYcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hx8POHjnq1sUK0olMwdcsLcmkyxVd5EJvsWWmAKPMS7MXPoL0ExGbTUhzlKFik4i6oogSyiZjqwHGJypzwH1VQ6AgONlRpwa7IUs4fNnuhEDpq3OMjZPgalfNUygl7CdJIycRjjahdJ+NlicK22ezK66TDRiFZKMOlyckwaVEtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=mckyGRrm; arc=fail smtp.client-ip=52.101.53.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="mckyGRrm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg9e4tNfszkkRK1Etn4RAbNmxeAYyGmzfBOgnQnOzNuIEjm3AQiBI40urksaf5Z8iEUVbL6Rc+wCjhsS36OANthJ+PIyVQ0w9uJ74ZIOfKOsyH7ud55kHkwGt08eTBwwPoszwTSlp3WTVOMdBkUQq/Cf+UNrawshra8dWRDRp6UCYj1NtDJTRw1hCGdkBkZUnd/v5E3X9+Lsl3L+rWg1G7zXor4bKEsb5+3Y0gd2jewKe3IIIXObyGHOLOM3wJo4tmHPmINLh1qu9I0SB4yF0CFGi+9cG8KI+zDjTBLc3m1P+kRZKGY2EUsT7jwbVTIGoCA4OJ+CghqUqXkucCPGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyedjqAtkvOOa6HSVw0LvM7gWqSuqXgSNnPbFxsVf18=;
 b=yMvkFEU5AtzKsqPb6/6pz6itYczqD5FcFU7bJR4ZTPZiNASu8UEFmZStJ4pVoqm3slAdHvKm+sRKRbr4Y+kamiJAWYc1HhT8RRvTPW/chaCeSC11uQ6y8Sa4ZwhctVPQ1fvU9UpEue4sBRHE6VHZrD+0Mz074pbUfE7b6MQn5EgSbiFqRnQI2PniciHfRhVrh94WiPbB/rnNoBU778Q7C0R8KaTW1pv9DoSs7IJReo259q6BxlsctT/XnvYA3aZ0hh4gb0QlFqqk37cq9yr9zFwWl37fuXwQnUyel/8LxGd2uTBNBQr9oLQ4Sdp76PGQBoWpwSI/s7LIsflia48DYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyedjqAtkvOOa6HSVw0LvM7gWqSuqXgSNnPbFxsVf18=;
 b=mckyGRrmhzu7q0PjPQG/41Yq/L8HY7olaMrU0vhjaG7Hb8lGyHDJQiB1jBo+YJ93tQIt28Ldn1+toeEwWeMVBNh5nllAhdbhLcfDy+L36iNjR8X7ptTQWVWwu77bk6DciOf4Nq5QBnP/sbXL6SePw8lYmx2lpBWeRf9a1bexiIDHam4J6ToZxietDbjiGZaqrAz7yQ9Va2WKd0ul3H9uSrtS7T6g46SVMjOA3QPf0M2H5k9+34on9AGfCQIzEXMEjHbpbvDV2pLwK2MHqHd24moWoCz7qS6vhny+gx3XV79ibi56yWj2+6wdU6Zjcf7/QbVUVrtYFxJGkv4qCGGeIQ==
Received: from SN7PR04CA0209.namprd04.prod.outlook.com (2603:10b6:806:126::34)
 by CO6PR18MB3793.namprd18.prod.outlook.com (2603:10b6:5:345::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 03:57:19 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::94) by SN7PR04CA0209.outlook.office365.com
 (2603:10b6:806:126::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.20 via Frontend Transport; Thu, 6
 Aug 2026 03:57:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Thu, 6 Aug 2026 03:57:19 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 9F05E4157BE1;
	Wed,  5 Aug 2026 20:57:18 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Wed, 05 Aug 2026 20:55:07 -0700
Subject: [PATCH] dt-bindings: gpio: cdns: keep AX3000 compatible in enum
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ax3005-gpio-keep-enum-follow-up-v1-1-9155fc19b631@axiado.com>
X-B4-Tracking: v=1; b=H4sIAJoFdGoC/x2NzQqDMBAGX0X23IVt/MH0VUoPYj91UZOQYBXEd
 zf0NMxl5qSEqEj0Kk6K+GlS77I8HwX1U+dGsH6zkxHTSCs1d0cpGWNQzzMQGG5befDL4nfeAlf
 Smr6xtrSoKFdCxKDH//D+XNcN7DRp53EAAAA=
X-Change-ID: 20260805-ax3005-gpio-keep-enum-follow-up-4082c69939e4
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jan Kotas <jank@cadence.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643; i=syang@axiado.com;
 h=from:subject:message-id; bh=pRjYt/eisFXwLiuZh1z8cGD5a9M68WOdz6QynsZEYcs=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqwSNomgn08k9VanbTv3OF3nP5OUWGXeAWmJpyuPlaqeO
 H40POFARykLgxgHg6yYIstXnW/5J3O173XuXVkKM4eVCWQIAxenAEzkEDPDf/8wax4X/d5T+5au
 v7D7WsmGmdq16gLP9HY2791wZ8lao1xGhr/Tpv7a9VZA/uv+uctn9s5aqth4+vrbHMnIG7tf1Ju
 e28UDAA==
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|CO6PR18MB3793:EE_
X-MS-Office365-Filtering-Correlation-Id: 281c9b63-f016-4a78-ee19-08def36ecff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|82310400026|1800799024|36860700016|13003099007|56012099006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	8ul7CBUzr433EIswAm9JTRaSMdvlJ4SiKiGcf5uYLa/nSKgfnp8NKA+O/rNo7gACg54t4b2ZRjVzaEV4iWYN7llMivjQWePwI8jy2/EmigGgIycTRCbOFKjJVpJ+frBsKxm+U1YlbPMCg+4npitfHM6tHPNKoLHlLaBjG2PZKs/SZQiBDUR6pwG9VVfzo5a3uFsLFFtUrL3RngKzREJcPVVQ+0tEUXMxV6cnDO4nJ7rQ4+vcoTeNsSlxQyH+jVlFwSHiZxDp8ffbzjtJkaEw54lrvSsH0mHnOJ8f7IDkHoS9wFaDdf0n07q7x/RcQDGbu9ilebbj4e+yWzf1cxKqq/Cc1jIRNbds+DWnoYeKD8Slmj2g0yM3a+VjL9pbyuxeoPa0PDGAY1jNV/F1GmzIAY81loyCS50hDzm1gIZNnIZwpuCcom1jlWMVTZrf3IcU56M2B78VnyWNUb2LxcHaThuqa18/LRGOqyz6uhT5AzHfUp/6sd8umWvWyq0lc7PPY9EY1LqOtKfPPX7BBRVKzl4ZIBze/OZOQMLFoT2s78OhUDaqL7XvaDbG3PuuDnGERmSXAaYJVhfWe5dGIByx6P8zlTiJ2jU7HrzE+tbtmuFwj+rv+biazXvwcmhEIrih3nUtp61WOfZNXz0jmQ+owSJrKpwTn5N5ZdFAFfPIV/5nvDexgNO9NDbAaIogCfN4mN1maFhVkUkr0cNg3ttK+Q==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(82310400026)(1800799024)(36860700016)(13003099007)(56012099006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xeXP+muhRwV5xy9IR7GsW5j+UmR9ColYvN3Sezs4V+m0ksbCiMTlCGKc0ioTGzHwnfAhBynz9QO6idLG42JXfQnJoFe0ZA4NYdN0I4VECS6U0k4otov+sTfAqvk2171S5pPHjl2QyixLJjGfprL072ESxcQxKxGU1+7ysmQa78KoqyBAsF1ESDhLrRkfy5lC+rgH9NAKqfSZEy2ckFLdyJRseTIVLC5PPwdD/UjR7BCZd3i79vJ45SLWQgHrslguSIaQb9U/fWRdj9EHnTTdAtYlquu+yHpAzfsbzhUqskkQNfvRlujAb5JBO31wWVKPIZJtf93IZLmYAzBr9cTHAga2B2SsGIXcmTwj1t9OT9IlmV7s4+mmS+fg5e+X9QmKSYDasPpHknCrcXrElwRcZAGrcltJRgrBWHHi2OU1enlkhPR7DVBppHBDb83eORXs
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 03:57:19.3051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 281c9b63-f016-4a78-ee19-08def36ecff7
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3793

Commit e8a40b356688 ("dt-bindings: gpio: cdns: add Axiado AX3005
GPIO variant") replaced the existing single-entry enum for the AX3000
compatible with a const.

Keep the existing enum form as requested during review. This is a
formatting-only change with no effect on schema validation.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link:
https://lore.kernel.org/all/20260717-prudent-indefinable-labradoodle-fcaa9e@quoll/

Signed-off-by: Swark Yang <syang@axiado.com>
---
This is a follow-up to commit e8a40b356688
("dt-bindings: gpio: cdns: add Axiado AX3005 GPIO variant").

The existing single-entry enum for AX3000 was unintentionally changed
to a const. Restore the original representation as requested during
review.
---
 Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
index 7eacf5af6554..ee3519eba2c2 100644
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -14,7 +14,8 @@ properties:
     oneOf:
       - const: cdns,gpio-r1p02
       - items:
-          - const: axiado,ax3000-gpio
+          - enum:
+              - axiado,ax3000-gpio
           - const: cdns,gpio-r1p02
       - items:
           - const: axiado,ax3005-gpio

---
base-commit: 6435d21cbd42fea6c66dfd4cfef7d58b9612497e
change-id: 20260805-ax3005-gpio-keep-enum-follow-up-4082c69939e4

Best regards,
-- 
Swark Yang <syang@axiado.com>

