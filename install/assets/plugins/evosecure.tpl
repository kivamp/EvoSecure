/**
 * EvoSecure
 *
 * Evo Manager secure plugin
 *
 * @category    plugin
 * @version     2.2
 * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @package     modx
 * @internal    @events OnManagerLoginFormPrerender,OnManagerLogout
 * @internal    @modx_category Manager and Admin
 * @internal    @properties &keyword=Keyword;string;admin;admin&redirect=Redirect;string;/;/
 * @internal    @installset base
 * @documentation
 * @author      KIVAMP (K4&)
 * @lastupdate  2020-04-03
 */
$e = $modx->event;
if ($e->name == "OnManagerLoginFormPrerender") {
	if (!empty($keyword)) {
		if ( isset($_GET[$keyword]) || (isset($_COOKIE['keyword']) && $_COOKIE['keyword'] == $keyword) ) {
			if ( !isset($_COOKIE['keyword']) || $_COOKIE['keyword'] != $keyword ) setcookie("keyword", $keyword);
		} else {
			if (empty($redirect)) {
				header('HTTP/1.0 403 Forbidden');
				die('Forbidden : Доступ запрещен');
			} else {
				$modx->sendRedirect($redirect);
			}
		}
	}
}