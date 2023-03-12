//

import Foundation
import LeanCloud


extension NoteDetailVC
{
    func delReply(_ reply: LCObject,_ indexPath:IndexPath)
    {
        showDelAlert(for: "回复") { _ in
            reply.delete { _ in}
            self.updateCommentCount(by: -1);
            self.replies[indexPath.section].replies.remove(at: indexPath.row);
            self.tableView.reloadData();
        }
    }
}
